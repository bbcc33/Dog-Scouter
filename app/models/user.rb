class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :dog_sightings
  has_many :cities

  # has_secure_password
  # validates :email, presence: true, uniqueness: true
end
