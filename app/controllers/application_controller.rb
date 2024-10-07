class ApplicationController < ActionController::Base
  helper_method :current_user, :user_signed_in?

  private

  # Define the current_user method to retrieve the logged-in user based on the session
  def current_user
    @current_user ||= User.find_by(id: session[:current_user])
  end

  # Check if a user is signed in
  def user_signed_in?
    current_user.present?
  end

  # This method will be used to restrict access to certain actions
  def authenticate_user!
    return if user_signed_in?

    flash[:alert] = 'You need to sign in before accessing this page.'
    redirect_to login_path # Adjust this to your login route
  end
end
