class CommentsController < ApplicationController
  def create
    @post = Post.find(params[:post_id])
    @comment = Comment.new(comment_params)
    if @comment.save
      redirect_to "/posts/#{@comment.post_id}"
    else
      @post = @comment.post
      @comments = @post.comments
      render "posts/show"
    end
  end

  def destroy
    @post_comment = Comment.find_by(user_id: current_user.id, post_id: params[:post_id])
    @post_comment.destroy
    redirect_to "posts/show"
  end

  private

  def comment_params
    params.require(:comment).permit(:text).merge(user_id: current_user.id, post_id: params[:post_id])
  end

end
