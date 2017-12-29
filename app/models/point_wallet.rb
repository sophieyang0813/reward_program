class PointWallet < ApplicationRecord
  belongs_to :user
  has_many :purchased_coupons
  has_one :booking

end
