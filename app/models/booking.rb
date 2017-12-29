class Booking < ApplicationRecord
  has_one :area
  has_one :user
  has_one :point_wallet
  
end
