class LikesController < ApplicationController
  def create
    @post = Post.find(params[:post_id])
    @post_like = Like.new(user_id: current_user.id, post_id: params[:post_id])
    @post_like.save
  end

  def destroy
    @post = Post.find(params[:post_id])
    @post_like = Like.find_by(user_id: current_user.id, post_id: params[:post_id])
    @post_like.destroy
  end
end
