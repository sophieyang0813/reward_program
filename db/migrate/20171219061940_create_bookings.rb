class CreateBookings < ActiveRecord::Migration[5.1]
  def change
    create_table :bookings do |t|
      t.belongs_to :user, index: true 
      t.integer :area_id
      t.integer :point_wallet_id
      t.datetime :check_in
      t.datetime :check_out
      t.integer :total_price

      t.timestamps
    end
  end
end
