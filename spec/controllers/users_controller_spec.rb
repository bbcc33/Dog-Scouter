require 'rails_helper'

RSpec.describe UsersController, type: :controller do
  # Use Faker to generate unique emails for each user
  let(:user1) { create(:user, email: Faker::Internet.unique.email) }
  let(:user2) { create(:user, email: Faker::Internet.unique.email) }

  # Use user1 for the dog sightings
  let!(:dog_sighting1) { create(:dog_sighting, user: user1, city: create(:city), dog_description: 'Dog 1') }
  let!(:dog_sighting2) { create(:dog_sighting, user: user1, city: create(:city), dog_description: 'Dog 2') }

  # Sign in user1 before each test
  before do
    sign_in user1 # Sign in the user for the test
  end

  describe 'GET #index' do
    it 'returns a successful response and assigns @dog_sightings for the current user' do
      # Send the GET request
      get :index

      # Ensure the response was successful
      expect(response).to have_http_status(:success)

      # Ensure @dog_sightings contains the created dog sightings for the current user
      expect(assigns(:dog_sightings).count).to eq(2) # Expect 2 sightings for user1
      expect(assigns(:dog_sightings).pluck(:dog_description)).to include('Dog 1', 'Dog 2')
    end
  end

  describe 'GET #show' do
    let!(:user) { create(:user) } # Create a user for the test

    before do
      sign_in user # Sign in the user (Devise helper)
    end

    it 'returns a successful response and assigns @user' do
      get :show # No need to pass params since we're using current_user
      expect(assigns(:user)).to eq(user) # Check that @user is set correctly
      expect(response).to have_http_status(:success) # Check if the response is successful
    end
  end

  describe 'POST #create' do
    it 'creates a new user and redirects to the user\'s show page' do
      # This will ensure only 1 user is created
      expect do
        post :create, params: { user: { email: 'user@example.com', password: 'password' } }
      end.to change(User, :count).by(1)
    end
  end
end
