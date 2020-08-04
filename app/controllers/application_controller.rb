class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  helper_method :current_user, :logged_in?, :authorize

  def current_user
    session[:current_user] ? User.find(session[:current_user]) : nil
  end

  def logged_in?
    !current_user.nil?
  end

  def authorize
    redirect_to login_path unless logged_in?
  end
end
