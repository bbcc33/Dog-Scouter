require 'rails_helper'

RSpec.describe City, type: :model do
  # Test validations
  it { should validate_presence_of(:name) }

  # Test associations
  it { should have_many(:dog_sightings) }

  # Test any instance methods
  it 'returns a full description of the city' do
    city = create(:city, name: 'Springfield')
    expect(city.full_description).to eq('City: Springfield')
  end
end
