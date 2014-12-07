class UsersController < ApplicationController
  before_action :set_post, only: [:edit, :update, :show]
  before_action :require_same_user, only: [:edit]

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)

    if @user.save
      flash[:notice] = 'You have successfully registered'
      redirect_to root_path
    else
      render :new
    end
  end

  def edit; end

  def update
    if @user.update(user_params)
      flash[:notice] = 'Your profile was updated'
      redirect_to user_path(@user)
    else
      render :edit
    end
  end

  def show; end

  private

  def user_params
    params.require(:user).permit(:username, :password, :time_zone)
  end

  def set_post
    @user = User.find_by slug: (params[:id])
  end

  def require_same_user
    if @user != current_user
      flash[:error] = "Sorry, you're not allowed to do that"
      redirect_to root_path
    end
  end
end



