class AddPurchasedCouponsToBookings < ActiveRecord::Migration[5.1]
  def change
    add_column :bookings, :purchased_coupon_id, :integer
  end
end
