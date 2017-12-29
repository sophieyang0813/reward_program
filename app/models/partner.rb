class Partner < ApplicationRecord
  has_secure_password
  has_many :areas
end
