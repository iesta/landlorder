class User < ActiveRecord::Base
  attr_accessible :name, :provider, :superpower, :uid, :ll_user_id, :ll_auth

  has_many :venues, :order => 'created_at DESC'

  def nickname
    (self.name && self.name.size>1) ? self.name : "User ##{self.id}"
  end

  def self.create_with_omniauth(auth)
    create! do |user|
      user.provider = auth["provider"]
      user.uid = auth["uid"]
      user.name = auth["info"]["name"]
    end
  end
end
