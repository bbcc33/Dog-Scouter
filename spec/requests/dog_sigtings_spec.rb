RSpec.describe 'DogSightings', type: :request do
  include RequestHelpers

  describe 'GET /index' do
    it 'returns a successful response' do
      get dog_sightings_path
      expect(response).to have_http_status(200)
    end

    it 'returns the correct number of dog sightings' do
      create_list(:dog_sighting, 5)
      get dog_sightings_path
      json_response = JSON.parse(response.body)
      expect(json_response.count).to eq(5)
    end

    it 'returns the correct data structure' do
      create(:dog_sighting)
      get dog_sightings_path
      json_response = JSON.parse(response.body).first
      expect(json_response).to have_key('id')
      expect(json_response).to have_key('dog_description')
      expect(json_response).to have_key('user_id')
      expect(json_response).to have_key('city_id')
    end
  end
end
