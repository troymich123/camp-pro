class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
    @posts = @user.posts
    @posts1 = @user.posts.where(user_id: @user.id, category_id: [2,3,4])
    @posts2 = @user.posts.where(user_id: @user.id, category_id: [5,6,7,8,9,10,11])
    @posts3 = @user.posts.where(user_id: @user.id, category_id: [12,13,14,15])
    @posts4 = @user.posts.where(user_id: @user.id, category_id: [16,17,18,19,20,21,22,23,24,25,26,27,28,29,30])
    @posts5 = @user.posts.where(user_id: @user.id, category_id: [31,32,33,34,35])
    @posts6 = @user.posts.where(user_id: @user.id, category_id: [36,37,38,39,40])
    @posts7 = @user.posts.where(user_id: @user.id, category_id: [41,42,43,44])
    @posts8 = @user.posts.where(user_id: @user.id, category_id: [45,46,47,48,49,50,51,52,53])
    @posts9 = @user.posts.where(user_id: @user.id, category_id: [54,55,56])
    @posts10 = @user.posts.where(user_id: @user.id, category_id: [57,58,59])
    @posts11 = @user.posts.where(user_id: @user.id, category_id: [60])
    @posts12 = @user.posts.where(user_id: @user.id, category_id: [61])
    @posts13 = @user.posts.where(user_id: @user.id, category_id: [62])
    @posts14 = @user.posts.where(user_id: @user.id, category_id: [63,64,65])
  end
end
