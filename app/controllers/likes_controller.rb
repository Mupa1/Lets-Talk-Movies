class LikesController < ApplicationController
  def create
    Like.create(OpinionId: params[:opinion_id], UserId: current_user.id)
    redirect_back fallback_location: root_path
  end

  def destroy
    @like = Like.find_user_like(current_user.id, params[:opinion_id])
    @like.destroy
    redirect_back fallback_location: root_path
  end
end
