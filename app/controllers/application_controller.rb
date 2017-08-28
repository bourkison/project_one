class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  # Because all controllers extend from this class, you're pretty much saying that before loading any page, fetch the user etc.
  before_action :fetch_user

  private
  def fetch_user
    # Find the user and store it in an instance variable, that way all pages can access it.
    @current_user = User.find_by :id => session[:user_id] if session[:user_id].present?
    session[:user_id] = nil unless @current_user.present?
  end

  def check_if_logged_in
    redirect_to login_path unless @current_user.present?
  end
end
