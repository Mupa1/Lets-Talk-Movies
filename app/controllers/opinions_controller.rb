class OpinionsController < ApplicationController
  before_action :authorize, only: [:index]

  def index
    @opinion = Opinion.new
    @opinions = Opinion.order('created_at DESC').includes(:Author).limit(5)
    @users = User.all_users(current_user.id).order('created_at DESC')
  end

  def new
    @opinion = current_user.opinions.build
  end

  def create
    @opinion = current_user.opinions.build(opinion_params)
    if @opinion.save
      flash[:success] = 'Review created successfully'
      redirect_to root_path
    end
  end

  def show
    @opinion = Opinion.find(params[:id])
  end

  private

  def opinion_params
    params.require(:opinion).permit(:Text)
  end
end
