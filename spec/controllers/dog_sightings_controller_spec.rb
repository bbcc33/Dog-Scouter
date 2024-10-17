require 'rails_helper'

RSpec.describe DogSightingsController, type: :controller do
  describe 'GET #index' do
    it 'assigns all dog sightings to @dog_sightings' do
      # Create a user and a city associated with that user
      user = create(:user)
      city = create(:city, user: user) # City needs a user_id

      # Create a dog_sighting associated with the city and user
      dog_sighting = create(:dog_sighting, city: city, user: user)

      # Make the GET request
      get :index

      # Ensure the dog_sightings variable is assigned correctly
      expect(assigns(:dog_sightings)).to include(dog_sighting)
    end
  end
end
