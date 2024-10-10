class User < ApplicationRecord
  has_many :dog_sightings
  has_many :cities

  has_secure_password
  validates :email, presence: true, uniqueness: true
end
