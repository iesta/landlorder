class Venue < ActiveRecord::Base
  attr_accessible :cat_color, :cat_id, :cat_image, :cat_name, :expected_profit, :expected_rent, :fsq_id, :market_value, :name, :venuid, :daily_costs

  belongs_to :user

  before_create :fetch_landlord_data, :remove_old

    require "net/https"
    require "uri"

  def remove_old
    Venue.delete_all(["fsq_id = ? AND user_id = ?" , self.fsq_id, self.user.id])
    #Venue.delete_all(["fsq_id = ?" , self.fsq_id])
  end

  def miss
    self.venuid.reverse
  end

  def buy
    @uri = URI.parse("https://www.landlordgame.com/v2-1-0/buyVenue.php")

    set_http()

    @request.set_form_data({
      "auth" => self.user.ll_auth,
      "userId" => self.user.ll_user_id,
      "venueId" => self.venuid
      })

    response = @http.request(@request)

    json = JSON.parse(response.body)
  end

  def fetch_landlord_data

    @uri = URI.parse("https://www.landlordgame.com/v2-1-0/postCheckin.php")

    set_http()

    @request.set_form_data({
      "auth" => AUTH,
      "userId" => USERID,
      "venueId" => self.fsq_id
      })

    response = @http.request(@request)


    json = JSON.parse(response.body)
    logger.debug json
    self.name = json['venueName']
    self.market_value = json['marketValue'].gsub(/[^0-9]/i, '').to_i
    self.venuid = json['venueId']
    self.expected_profit = json['expectedProfit'].gsub(/[^0-9]/i, '').to_i
    self.expected_rent = json['expectedRent'].gsub(/[^0-9]/i, '').to_i
    self.daily_costs = json['dailyCosts'].gsub(/[^0-9]/i, '').to_i
    self.cat_name = json['categoryInfo']['name']
  end

  protected

  def set_http
    @http = Net::HTTP.new(@uri.host, @uri.port)
    @http.use_ssl = true
    @http.verify_mode = OpenSSL::SSL::VERIFY_NONE
    @request = Net::HTTP::Post.new(@uri.request_uri)
    @request.add_field 'Content-Type', 'application/x-www-form-urlencoded; charset=utf-8'
    @request.add_field 'X-Requested-With', 'XMLHttpRequest'
    @request.add_field 'Proxy-Connection', 'close'
    @request.add_field 'Accept-Encoding', 'gzip'
    @request.add_field 'User-Agent', 'Appcelerator Titanium/2.1.3.GA (iPhone/6.0.1; iPhone OS; fr_BE;)'
  end

end
