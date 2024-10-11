class ApplicationController < ActionController::Base
  helper_method :current_user, :user_signed_in?
  before_action :authenticate_user! # Devise handles the authentication

  private

  # Define the current_user method to retrieve the logged-in user based on the session
  def current_user
    @current_user ||= User.find_by(id: session[:current_user]) || NullUser.new
  end

  # Check if a user is signed in
  def user_signed_in?
    current_user.present?
  end

  # This method will be used to restrict access to certain actions
  def authenticate_user!
    return if user_signed_in?

    flash[:alert] = 'You need to sign in before accessing this page.'
    redirect_to login_path # Redirects to your login path
  end

  protected

  def after_sign_in_path_for(resource)
    root_path # Redirects to home after sign in
  end

  def after_sign_out_path_for(resource_or_scope)
    root_path # Redirects to home after sign out
  end
end
