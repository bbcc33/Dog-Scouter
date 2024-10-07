class City < ApplicationRecord
  has_many :dog_sightings
  belongs_to :user, optional: true
end
