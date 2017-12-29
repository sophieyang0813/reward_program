class User < ApplicationRecord
  has_secure_password 
  has_one :point_wallet
  has_many :bookings
  mount_uploader :avatar, AvatarUploader
end
