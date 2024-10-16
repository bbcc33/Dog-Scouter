require 'rails_helper'

RSpec.describe CitiesController, type: :controller do
  describe 'GET #index' do
    it 'returns a successful response and assigns @cities' do
      # Create a user and a few cities
      user = create(:user)
      create(:city, user: user, city_name: 'City 1')
      create(:city, user: user, city_name: 'City 2')

      # Send the GET request
      get :index

      # Ensure the response was successful
      expect(response).to have_http_status(:success)

      # Ensure @cities is assigned and contains the cities created
      expect(assigns(:cities).count).to eq(2)
      expect(assigns(:cities).pluck(:city_name)).to include('City 1', 'City 2')
    end
  end

  describe 'GET #show' do
    it 'returns a successful response and assigns @city' do
      # Create a user and a city
      user = create(:user)
      city = create(:city, user: user)

      # Send the GET request to show a specific city
      get :show, params: { id: city.id }

      # Ensure the response was successful
      expect(response).to have_http_status(:success)

      # Ensure @city is assigned
      expect(assigns(:city)).to eq(city)
    end
  end

  describe 'POST #create' do
    it 'creates a new city and redirects to the show page' do
      # Create a user for the city
      user = create(:user)

      # Send the POST request to create a new city
      post :create, params: { city: { city_name: 'New City', user_id: user.id } }

      # Ensure the city was created and redirected to the show page
      expect(City.count).to eq(1)
      expect(response).to redirect_to(city_path(City.last))
    end
  end
end
