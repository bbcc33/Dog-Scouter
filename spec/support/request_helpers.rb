module RequestHelpers
  def create_city(city_name = 'CityName')
    create(:city, city_name: city_name)
  end

  def create_user(email = 'user@example.com', password = 'password123')
    create(:user, email: email, password: password)
  end

  def authenticate_user(user)
    post user_session_path, params: { user: { email: user.email, password: user.password } }
  end
end
