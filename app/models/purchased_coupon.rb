class PurchasedCoupon < ApplicationRecord
  belongs_to :promotion
  belongs_to :point_wallet
  
end
