class OpinionsController < ApplicationController
  before_action :authorize, only: %i[index]
  before_action :set_opinion, only: %i[edit update destroy]
  before_action :require_same_user, only: %i[edit update destroy]

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

  def edit; end

  def update
    if @opinion.update(opinion_params)
      flash[:notice] = 'Your movie review was updated'
      redirect_to opinion_path(@opinion)
    else
      render :edit
    end
  end

  def destroy
    @opinion.destroy
    flash[:danger] = 'Review successfully deleted'
    redirect_to root_path
  end

  private

  def set_opinion
    @opinion = Opinion.find(params[:id])
  end

  def opinion_params
    params.require(:opinion).permit(:Text)
  end

  def require_same_user
    if current_user != @opinion.Author
      flash[:danger] = 'You can only edit or delete your own review'
      redirect_to root_path
    end
  end
end
