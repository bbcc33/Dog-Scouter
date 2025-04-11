class DogSighting < ApplicationRecord
  belongs_to :city
  belongs_to :user
  has_many :comments, dependent: :destroy
end
