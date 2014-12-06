class CommentsController < ApplicationController
  before_action :require_user

  def create
    @post = Post.find(params[:post_id])
    @comment = Comment.new(comment_params)
    @post.comments << @comment
    @comment.creator = current_user

    if @comment.save
      flash[:notice] = 'Your comment was saved'
      redirect_to post_path(@post)
    else
      render 'posts/show'
    end
  end

  private

  def comment_params
    params.require(:comment).permit(:body)
  end
end