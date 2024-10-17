RSpec.describe 'Users', type: :request do
  include RequestHelpers

  describe 'GET /index' do
    it 'returns a successful response' do
      get users_path
      expect(response).to have_http_status(200)
    end

    it 'returns the correct number of users' do
      create_list(:user, 4)
      get users_path
      json_response = JSON.parse(response.body)
      expect(json_response.count).to eq(4)
    end
  end
end
