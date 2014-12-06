class UsersController < ApplicationController
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

  def edit
    @user = User.find(params[:id])
  end

  def update
    
  end

  def show
    @user = User.find(params[:id])
  end

  private

  def user_params
    params.require(:user).permit(:username, :password)
  end

  def require_same_user
    if @user != current_user
      flash[:error] = "Sorry, you're not allowed to do that"
      redirect_to root_path
    end
  end
end