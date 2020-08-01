class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      flash[:success] = 'Successfully Registered'
      redirect_to root_path
    else
      render 'new'
    end
  end

  def show
    @user = User.find(params[:id])
    @opinions = @user.opinions.order('created_at DESC').limit(5)
  end

  private

  def user_params
    params.require(:user).permit(:Username, :Fullname, :Photo)
  end
end
