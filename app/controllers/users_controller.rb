class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
    @posts = @user.posts
    @posts1 = @user.posts.where(user_id: @user.id, category_id: [2,3,4]).order(updated_at: :desc)
    @posts2 = @user.posts.where(user_id: @user.id, category_id: [5,6,7,8,9,10,11]).order(updated_at: :desc)
    @posts3 = @user.posts.where(user_id: @user.id, category_id: [12,13,14,15]).order(updated_at: :desc)
    @posts4 = @user.posts.where(user_id: @user.id, category_id: [16,17,18,19,20,21,22,23,24,25,26,27,28,29,30]).order(updated_at: :desc)
    @posts5 = @user.posts.where(user_id: @user.id, category_id: [31,32,33,34,35]).order(updated_at: :desc)
    @posts6 = @user.posts.where(user_id: @user.id, category_id: [36,37,38,39,40]).order(updated_at: :desc)
    @posts7 = @user.posts.where(user_id: @user.id, category_id: [41,42,43,44]).order(updated_at: :desc)
    @posts8 = @user.posts.where(user_id: @user.id, category_id: [45,46,47,48,49,50,51,52,53]).order(updated_at: :desc)
    @posts9 = @user.posts.where(user_id: @user.id, category_id: [54,55,56]).order(updated_at: :desc)
    @posts10 = @user.posts.where(user_id: @user.id, category_id: [57,58,59]).order(updated_at: :desc)
    @posts11 = @user.posts.where(user_id: @user.id, category_id: [60]).order(updated_at: :desc)
    @posts12 = @user.posts.where(user_id: @user.id, category_id: [61]).order(updated_at: :desc)
    @posts13 = @user.posts.where(user_id: @user.id, category_id: [62]).order(updated_at: :desc)
    @posts14 = @user.posts.where(user_id: @user.id, category_id: [63,64,65]).order(updated_at: :desc)
  end
end
