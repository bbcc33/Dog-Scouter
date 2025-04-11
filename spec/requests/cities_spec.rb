RSpec.describe 'Cities', type: :request do
  include RequestHelpers

  describe 'GET /index' do
    it 'returns a successful response' do
      get cities_path
      expect(response).to have_http_status(200)
    end

    it 'returns the correct number of cities' do
      create_list(:city, 3)
      get cities_path
      json_response = JSON.parse(response.body)
      expect(json_response.count).to eq(3)
    end
  end
end
