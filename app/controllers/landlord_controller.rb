# TODO : use LandlordRequest

class LandlordController < ApplicationController
  before_filter :logged_in?

  require "net/https"
  require "uri"
  
  def index
    @uri = URI.parse("https://www.landlordgame.com/v2-1-0/getUserDetails.php")

    set_http()

    @request.set_form_data({
      "auth" => current_user.ll_auth,
      "userId" => current_user.ll_user_id
      })

    response = @http.request(@request)
    begin
      @json = JSON.parse(response.body)
      session[:bankBalance] = @json['bankBalance']
      session[:formattedNetWorth] = @json['formattedNetWorth']
      session[:coinsBalance] = @json['coinsBalance']
    rescue
      redirect_to "/account", :notice => "Please set you userId and auth token (hard to find)"
    end

  end

  def portfolio
    @uri = URI.parse("https://www.landlordgame.com/v2-1-0/getPortfolio.php")

    set_http()

    @request.set_form_data({
      "auth" => current_user.ll_auth,
      "userId" => current_user.ll_user_id
      })

    response = @http.request(@request)
    begin
      @json = JSON.parse(response.body)
    rescue
      redirect_to "/account", :notice => "Please set you userId and auth token (hard to find)"
    end

  end

  def activity
    @uri = URI.parse("https://www.landlordgame.com/v2-1-0/getActivity.php")

    set_http()

    @request.set_form_data({
      "auth" => current_user.ll_auth,
      "userId" => current_user.ll_user_id,
      "timezone" => "3600",
      "since" => Time.now.to_i - 80000
      })
    response = @http.request(@request)
    begin
      @json = JSON.parse(response.body)
    rescue
      redirect_to "/account", :notice => "Please set you userId and auth token (hard to find)"
    end
  end


  def sell
    @uri = URI.parse("https://www.landlordgame.com/v2-1-0/sellVenue.php")

    set_http()

    @request.set_form_data({
      "auth" => current_user.ll_auth,
      "userId" => current_user.ll_user_id,
      "venueId" => params[:id]
      })

    response = @http.request(@request)
    respond_to do |format|
      msg = response.body
      format.html { redirect_to portfolio_path, notice: "Msg : #{msg}" }
    end
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
