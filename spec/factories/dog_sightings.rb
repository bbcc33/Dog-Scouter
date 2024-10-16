# spec/factories/dog_sightings.rb
FactoryBot.define do
  factory :dog_sighting do
    dog_description { 'A brown dog' }
    location { '123 Main St' }
    city
    user
  end
end
