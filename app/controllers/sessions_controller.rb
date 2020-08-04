class SessionsController < ApplicationController
  def new; end

  def create
    @user = User.find_by(sign_in_params)
    if @user
      session[:current_user] = @user.id
      flash[:success] = 'Welcome ' + current_user.Fullname
      redirect_to root_path
    else
      flash[:danger] = 'Invalid inputs. Please try again or register first.'
      render 'new'
    end
  end

  def destroy
    session[:user_id] = nil
    flash[:success] = 'You have logged out'
    redirect_to login_path
  end

  private

  def sign_in_params
    params.permit(:username)
  end
end
