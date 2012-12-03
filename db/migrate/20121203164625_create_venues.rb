class CreateVenues < ActiveRecord::Migration
  def change
    create_table :venues do |t|
      t.string :name
      t.string :venuid
      t.integer :market_value
      t.integer :expected_profit
      t.integer :expected_rent
      t.integer :daily_costs
      t.string :cat_id
      t.string :cat_name
      t.string :cat_color
      t.string :cat_image
      t.string :fsq_id

      t.timestamps
    end
  end
end
