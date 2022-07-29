class PostsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :edit]
  before_action :set_post, only: [:show, :edit, :update, :destroy]
  before_action :redirect_root, only: [:edit, :destroy]

  def index
    @posts = Post.all.includes(:likes).order(updated_at: :desc).page(params[:page]).per(6)
    @posts_best = Post.all.includes(:likes).sort { |a, b| b.likes.size <=> a.likes.size }
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
    if @post.save
      # 経験値アップ・レベルアップ機能
      user = User.find(current_user.id)
      user.exp_point = user.exp_point + 1
      user.update(exp_point: user.exp_point)
      if user.rank < 26
        ranksetting = RankSetting.find_by(rank: user.rank + 1)
        if ranksetting.threshold <= user.exp_point
          user.rank = user.rank + 1
          user.rank_name = ranksetting.rank_name
          user.update(rank: user.rank, rank_name: user.rank_name)
        end
      end
      # /経験値アップ・レベルアップ機能
      redirect_to root_path
    else
      render :new
    end
  end

  def show
    @comment = Comment.new
    @comments = @post.comments.order(id: 'DESC')
  end

  def edit
  end

  def update
    if @post.update(post_params)
      redirect_to post_path
    else
      render :edit
    end
  end

  def destroy
    @post.destroy
    # 経験値ダウン・レベルダウン機能
    user = User.find(current_user.id)
    user.exp_point = user.exp_point - 1
    user.update(exp_point: user.exp_point)
    if user.rank > 1
      ranksetting = RankSetting.find_by(rank: user.rank - 1)
      if ranksetting.threshold <= user.exp_point
        user.rank = user.rank - 1
        user.rank_name = ranksetting.rank_name
        user.update(rank: user.rank, rank_name: user.rank_name)
      end
    end
    # /経験値ダウン・レベルダウン機能
    redirect_to root_path
  end

  def category
    @post = Post.find_by(category_id: params[:id])
    @posts = Post.where(category_id: params[:id]).order(created_at: 'DESC')
  end

  def brand
    @post = Post.find_by(brand_id: params[:id])
    @posts = Post.where(brand_id: params[:id]).order('created_at DESC')
  end

  private

  def post_params
    params.require(:post).permit(:category_id, :brand_id, :gearmodel, :text, :image).merge(user_id: current_user.id)
  end

  def set_post
    @post = Post.find(params[:id])
  end

  def redirect_root
    redirect_to root_path unless user_signed_in? && current_user.id == @post.user_id
  end
end
