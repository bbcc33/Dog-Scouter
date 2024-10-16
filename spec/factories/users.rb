FactoryBot.define do
  factory :user do
    email { 'user@example.com' }
    password { 'password' }
    password_confirmation { 'password' } # If using Devise
  end
end
