# RSpec.describe CitiesController, type: :controller do
#   # Set up a city to be used in the tests
#   let!(:city) { create(:city) }

#   describe 'GET #index' do
#     it 'returns a successful response' do
#       get :index
#       expect(response).to have_http_status(:ok)
#     end

#     it 'assigns @cities' do
#       get :index
#       expect(assigns(:cities)).to eq([city])
#     end
#   end

#   describe 'GET #show' do
#     it 'returns a successful response' do
#       get :show, params: { id: city.id }
#       expect(response).to have_http_status(:ok)
#     end

#     it 'assigns @city' do
#       get :show, params: { id: city.id }
#       expect(assigns(:city)).to eq(city)
#     end
#   end
# end
