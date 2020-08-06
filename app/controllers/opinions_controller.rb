class OpinionsController < ApplicationController
  before_action :authorize, only: %i[index]

  def index
    @opinion = Opinion.new
    @opinions = Opinion.all.ordered_by_most_recent.includes(:likes, :Author)
    @users = User.all_users_except_me(current_user).includes(:likes)
  end

  def new
    @opinion = Opinion.new
  end

  def create
    @opinion = current_user.opinions.build(opinion_params)
    if @opinion.save
      flash[:success] = 'Review created successfully.'
    else
      flash[:danger] = 'Opinion cannot be less than 3 or more than 250 characters.'
    end
    redirect_to root_path
  end

  def show
    @opinion = Opinion.find(params[:id]).includes(:likes)
  end

  private

  def opinion_params
    params.require(:opinion).permit(:Text)
  end
end
