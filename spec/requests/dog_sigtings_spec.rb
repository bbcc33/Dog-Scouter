require 'rails_helper'

RSpec.describe 'Dog_Sightings', type: :request do
  describe 'GET /index' do
    it 'returns a successful response' do
      get dog_sightings_path
      expect(response).to have_http_status(200)
    end
  end
end
