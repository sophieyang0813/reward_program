class Area < ApplicationRecord
  mount_uploader :avatar, AvatarUploader
  has_many :bookings
  has_many :promotions
  has_one :partner
end
