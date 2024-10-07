require 'rails_helper'

RSpec.describe 'Cities', type: :request do
  describe 'GET /index' do
    it 'returns a successful response' do
      get cities_path
      expect(response).to have_http_status(200)
    end
  end
end
