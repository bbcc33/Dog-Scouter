class ApplicationController < ActionController::Base
  before_action :authenticate_user! # Devise handles authentication for us

  protected

  def after_sign_in_path_for(_)
    root_path
  end

  def after_sign_out_path_for(_)
    root_path
  end
end
