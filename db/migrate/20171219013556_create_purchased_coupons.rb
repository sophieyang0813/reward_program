class CreatePurchasedCoupons < ActiveRecord::Migration[5.1]
  def change
    create_table :purchased_coupons do |t|
      t.belongs_to :promotion, index: true 
      t.belongs_to :point_wallet, index: true 
      t.datetime :claimed_date

      t.timestamps
    end
  end
end
