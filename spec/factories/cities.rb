FactoryBot.define do
  factory :city do
    city_name { 'Example City' }
    association :user
  end
end
