# RSpec.describe UsersController, type: :controller do
#   let!(:user) { create(:user) }

#   describe 'GET #index' do
#     it 'returns a successful response' do
#       get :index
#       expect(response).to have_http_status(:ok)
#     end

#     it 'assigns @users' do
#       get :index
#       expect(assigns(:users)).to eq([user])
#     end
#   end

#   describe 'GET #show' do
#     it 'returns a successful response' do
#       get :show, params: { id: user.id }
#       expect(response).to have_http_status(:ok)
#     end

#     it 'assigns @user' do
#       get :show, params: { id: user.id }
#       expect(assigns(:user)).to eq(user)
#     end
#   end
# end
