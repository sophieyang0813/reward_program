class AddDiscountedPriceToBooking < ActiveRecord::Migration[5.1]
  def change
     add_column :bookings, :discounted_price, :integer
  end
end
