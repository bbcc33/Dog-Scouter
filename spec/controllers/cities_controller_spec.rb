require 'rails_helper'

RSpec.describe CitiesController, type: :controller do
  # Define a user to use in tests
  let(:user) { create(:user) }

  # Ensure user is signed in for tests that require authentication
  before do
    sign_in user
  end

  describe 'POST #create' do
    it 'creates a new city and redirects to the cities index' do
      # Set up valid city attributes
      city_attributes = { city_name: 'New City', user_id: user.id }

      # Send POST request to create a city
      post :create, params: { city: city_attributes }

      # Ensure that the city is created
      expect(City.count).to eq(1)

      # Ensure the user is redirected to the index page
      expect(response).to redirect_to(cities_path)

      # Check that the city has the correct attributes
      expect(City.last.city_name).to eq('New City')
    end
  end
end
