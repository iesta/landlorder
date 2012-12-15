class Venue < ActiveRecord::Base

  attr_accessible :cat_color, :cat_id, :cat_image, :cat_name, :expected_profit, :expected_rent, 
                  :fsq_id, :market_value, :name, :venuid, :daily_costs

  belongs_to :user

  before_create :fetch_landlord_data, :remove_old

  def remove_old
    Venue.delete_all(["fsq_id = ? AND user_id = ?" , self.fsq_id, self.user.id])
    #Venue.delete_all(["fsq_id = ?" , self.fsq_id])
  end

  def buy

    response = LandlordRequest.post(
      "https://www.landlordgame.com/v2-1-0/buyVenue.php" ,
      {
      "auth" => self.user.ll_auth,
      "userId" => self.user.ll_user_id,
      "venueId" => self.venuid
      }
    )

    json = JSON.parse(response.body)
  end

  def fetch_landlord_data

    response = LandlordRequest.post(
      "https://www.landlordgame.com/v2-1-0/postCheckin.php" ,
      {
        "auth" => self.user.ll_auth,
        "userId" => self.user.ll_user_id,
        "venueId" => self.fsq_id
      }
    )

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

end
