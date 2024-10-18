class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :dog_sighting
  validates :content, presence: true
end
