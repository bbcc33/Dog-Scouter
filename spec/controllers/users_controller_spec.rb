require 'rails_helper'

RSpec.describe UsersController, type: :controller do
  describe "GET #index" do
    it "returns a successful response and assigns @users" do
      # Create some users
      create(:user, email: "user1@example.com")
      create(:user, email: "user2@example.com")

      # Send the GET request
      get :index

      # Ensure the response was successful
      expect(response).to have_http_status(:success)

      # Ensure @users is assigned and contains the created users
      expect(assigns(:users).count).to eq(2)
      expect(assigns(:users).pluck(:email)).to include("user1@example.com", "user2@example.com")
    end
  end

  describe "GET #show" do
    it "returns a successful response and assigns @user" do
      # Create a user
      user = create(:user)

      # Send the GET request to show the user
      get :show, params: { id: user.id }

      # Ensure the response was successful
      expect(response).to have_http_status(:success)

      # Ensure @user is assigned
      expect(assigns(:user)).to eq(user)
    end
  end

  describe "POST #create" do
    it "creates a new user and redirects to the user's show page" do
      # Send the POST request to create a new user
      post :create, params: { user: { email: "newuser@example.com", password: "password" } }

      # Ensure the user was created and redirected to the show page
      expect(User.count).to eq(1)
      expect(response).to redirect_to(user_path(User.last))
    end
  end
end
