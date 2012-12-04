class User < ActiveRecord::Base
  attr_accessible :name, :provider, :superpower, :uid, :ll_user_id, :ll_auth

  def self.create_with_omniauth(auth)
    create! do |user|
      user.provider = auth["provider"]
      user.uid = auth["uid"]
      user.name = auth["info"]["name"]
    end
  end
end
