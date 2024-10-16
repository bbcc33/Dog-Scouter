RSpec.describe 'Dog_Sightings', type: :request do
  describe 'GET /index' do
    it 'returns a successful response' do
      get dog_sightings_path
      expect(response).to have_http_status(200)
    end

    it 'returns the correct number of dog sightings' do
      create_list(:dog_sighting, 5)
      get dog_sightings_path
      expect(assigns(:dog_sightings).count).to eq(5)
    end
  end
end
