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

  def vote
    vote = Vote.create(voteable: Comment.find(params[:id]), creator: current_user, vote: params[:vote])

    if vote.valid?
      flash[:notice] = 'Your vote was counted'
    else
      flash[:error] = 'Your vote was not counted'
    end

    redirect_to :back
  end

  private

  def comment_params
    params.require(:comment).permit(:body)
  end
end