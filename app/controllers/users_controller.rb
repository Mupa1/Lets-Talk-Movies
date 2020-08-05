class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      session[:current_user] = @user.id
      flash[:success] = 'Successfully Registered'
      redirect_to root_path
    else
      render 'new'
    end
  end

  def show
    @user = User.find(params[:id])
    @opinions = @user.opinions.order('created_at DESC').limit(5).includes(:Author).to_a
    @followers = User.user_followers(params[:id], current_user.id)
  end

  private

  def user_params
    params.require(:user).permit(:Username, :Fullname, :Photo, :CoverImage)
  end
end
