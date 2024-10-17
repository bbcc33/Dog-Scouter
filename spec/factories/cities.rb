FactoryBot.define do
  factory :city do
    city_name { Faker::Address.city }
    association :user
  end
end
