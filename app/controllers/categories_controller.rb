class CategoriesController < ApplicationController
  def index
    @posts = Post.all
  end

  def show
    @user = User.find(params[:id])
    @posts = @user.posts
  end
end
