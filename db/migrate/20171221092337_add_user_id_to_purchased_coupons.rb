class AddUserIdToPurchasedCoupons < ActiveRecord::Migration[5.1]
  def change
    add_column :purchased_coupons, :user_id, :integer
  end
end
