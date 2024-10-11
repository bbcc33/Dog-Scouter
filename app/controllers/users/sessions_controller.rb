class Users::SessionsController < Devise::SessionsController
  # GET /users/sign_in
  def new
    super
  end

  # POST /users/sign_in
  def create
    super
  end

  # DELETE /users/sign_out
  def destroy
    super
  end

  protected

  # Redirect to the desired location after sign in
  def after_sign_in_path_for(resource)
    root_path # Redirects to home after sign in
  end

  # Redirect to the desired location after sign out
  def after_sign_out_path_for(resource_or_scope)
    root_path # Redirects to home after sign out
  end
end
