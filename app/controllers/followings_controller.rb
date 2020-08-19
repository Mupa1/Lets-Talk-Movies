class FollowingsController < ApplicationController
  def create
    Following.create(FollowerId: current_user.id, FollowedId: params[:followed_id])
    redirect_to user_path(params[:followed_id])
  end

  def destroy
    @followings = Following.find_friend_to_unfollow(current_user.id, params[:followed_id])
    @followings.destroy
    redirect_to user_path(params[:followed_id])
  end
end
