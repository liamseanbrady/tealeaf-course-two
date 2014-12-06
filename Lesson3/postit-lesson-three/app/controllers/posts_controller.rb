class PostsController < ApplicationController
  before_action :set_post, only: [:edit, :update, :show]
  before_action :require_user, except: [:index, :show]

  def index
    @posts = Post.all
  end

  def new
    @post = Post.new   
  end

  def create
    @post = Post.new(post_params)
    @post.creator = current_user

    if @post.save
      flash[:notice] = 'Your post was added'
      redirect_to posts_path
    else
      render :new
    end
  end

  def edit; end

  def update
    if @post.update(post_params)
      flash[:notice] = 'Your post was updated'
      redirect_to post_path(@post)
    else
      render :edit
    end
  end

  def show
    @comment = Comment.new
  end

  private

  def post_params
    params.require(:post).permit(:title, :url, :description, category_ids: [])
  end

  def set_post
    @post = Post.find(params[:id])
  end
end




