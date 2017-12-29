class Promotion < ApplicationRecord
  mount_uploader :avatar, AvatarUploader
  has_one :area
  has_many :purchased_coupons

  scope :promo, -> (promo) {
    where('name ILIKE ? OR description ILIKE ?', "%#{promo}%","%#{promo}%")}


end