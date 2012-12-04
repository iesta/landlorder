class AddUserIds < ActiveRecord::Migration
  def change
    add_column :venues, :user_id, :integer
    Venue.all.each{|v| v.update_attribute('user_id',1)}
  end

end
