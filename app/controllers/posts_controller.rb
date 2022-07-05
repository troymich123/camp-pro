class PostsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :edit]

  def index
    @posts = Post.order('created_at DESC')
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
    if @post.save
      redirect_to root_path
    else
      render :new
    end
  end

  private

  def post_params
    params.require(:post).permit(:category_id, :brand_id, :gearmodel_id, :text, :image).merge(user_id: current_user.id)
  end
end