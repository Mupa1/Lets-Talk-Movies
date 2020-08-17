class SessionsController < ApplicationController
  before_action :user_already_signed_in, except: %i[destroy]

  def new; end

  def create
    user = User.find_by(Username: params[:session][:Username].downcase)
    if user
      session[:current_user] = user.id
      flash[:success] = 'Welcome ' + current_user.Fullname
      redirect_to root_path(user)
    else
      flash[:danger] = 'Incorrect username, please try again or register first.'
      redirect_to login_path
    end
  end

  def destroy
    session[:current_user] = nil
    flash[:success] = 'You have logged out'
    redirect_to login_path
  end
end
