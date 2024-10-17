RSpec.describe DogSightingsController, type: :controller do
  let!(:dog_sighting) { create(:dog_sighting) }

  describe 'GET #index' do
    it 'returns a successful response' do
      get :index
      expect(response).to have_http_status(:ok)
    end

    it 'assigns @dog_sightings' do
      get :index
      expect(assigns(:dog_sightings)).to eq([dog_sighting])
    end
  end

  describe 'GET #show' do
    it 'returns a successful response' do
      get :show, params: { id: dog_sighting.id }
      expect(response).to have_http_status(:ok)
    end

    it 'assigns @dog_sighting' do
      get :show, params: { id: dog_sighting.id }
      expect(assigns(:dog_sighting)).to eq(dog_sighting)
    end
  end
end
