class ApplicationController < ActionController::Base
  def current_user
    session[:current_user] ? User.find(session[:current_user]) : nil
  end

  def user_already_signed_in
    return if current_user.nil?

    flash[:warning] = 'Already signed in, sign out if you want to reconnect as another user or create a new account'
    redirect_to root_path
    false
  end

  def authorize
    return unless current_user.nil?

    redirect_to login_path
    false
  end
end
