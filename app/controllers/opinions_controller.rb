class OpinionsController < ApplicationController
  before_action :authorize, only: %i[index]

  def index
    @opinion = Opinion.new
    @opinions = Opinion.order('created_at DESC').includes(:Author).limit(5)
    @users = User.all_users(current_user).order('created_at DESC')
  end

  def new
    @opinion = Opinion.new
  end

  def create
    @opinion = Opinion.new(opinion_params)
    @opinion.AuthorId = current_user.id
    if @opinion.save
      flash[:success] = 'Review created successfully.'
    else
      flash[:danger] = 'Opinion cannot be less than 3 or more than 250 characters.'
    end
    redirect_to root_path
  end

  def show
    @opinion = Opinion.find(params[:id])
  end

  private

  def opinion_params
    params.require(:opinion).permit(:Text)
  end
end
