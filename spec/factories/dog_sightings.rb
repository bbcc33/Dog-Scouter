FactoryBot.define do
  factory :dog_sighting do
    association :user  # Ensures the dog_sighting is associated with a user
    association :city  # Ensures the dog_sighting is associated with a city
    dog_description { 'A dog' }
  end
end
