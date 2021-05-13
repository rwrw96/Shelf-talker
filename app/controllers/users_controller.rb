class UsersController < ApplicationController
  before_action :authenticate_user!, only: [:index, :show, :edit]
  def edit
    @user = User.find(params[:id])
    if @user != current_user
      redirect_to root_path
    end
  end
  
  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
       redirect_to user_path(@user.id)
    else
       flash[:alert] = "Nameが未入力です"
       render :edit
    end
  end
  
  def follows
    user = User.find(params[:id])
    @users = user.followings
  end

  def followers
    user = User.find(params[:id])
    @users = user.followers
  end
  
  def show
    @user = User.find(params[:id])
  end
  
  def index
    @users = User.all
  end
  
  private
  def user_params
    params.require(:user).permit(:name,:introduction,:image_name)
  end
end

