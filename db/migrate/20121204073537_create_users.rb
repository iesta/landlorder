class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :provider
      t.string :uid
      t.string :name
      t.string :superpower
      t.string :ll_user_id
      t.string :ll_auth

      t.timestamps
    end
  end
end
