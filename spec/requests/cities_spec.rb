RSpec.describe 'Cities', type: :request do
  describe 'GET /index' do
    it 'returns a successful response' do
      get cities_path
      expect(response).to have_http_status(200)
    end

    it 'returns the correct number of cities' do
      # assuming you have some cities in your database
      create_list(:city, 3)
      get cities_path
      expect(assigns(:cities).count).to eq(3)
    end
  end
end
