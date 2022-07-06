class LikesController < ApplicationController
  def create
    @post_like = Like.new(user_id: current_user.id, post_id: params[:post_id])
    @post_like.save
    redirect_to root_path
  end

  def destroy
    @post_like = Like.find_by(user_id: current_user.id, post_id: params[:post_id])
    @post_like.destroy
    redirect_to root_path
  end

end
