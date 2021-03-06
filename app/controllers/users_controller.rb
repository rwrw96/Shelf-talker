class UsersController < ApplicationController
  # ログインユーザーのみ許可する
  before_action :authenticate_user!, only: [:index, :show, :edit]
  
  def index
    @users = User.all
    @admin_user = User.find_by(admin: true)
    # 検索機能
    @q = User.ransack(params[:q])
    @users = @q.result
  end
  
  def show
    @user = User.find(params[:id])
    # ゲストユーザーを取得
    @guest_user = User.find_by(email: "guest@example.com")
    # 1ページで4件ごと取得
    @q = Review.ransack(params[:q])
    @my_reviews = @q.result.page(params[:page]).per(4)
  end
  
  def edit
    @user = User.find(params[:id])
    if @user != current_user
      redirect_to root_path
    end
  end

  def update
    @user = User.find(params[:id])
    if  @user.update(user_params)
      redirect_to user_path(@user.id)
    else
      flash[:alert] = "Nameが未入力です"
      render :edit
    end
  end

  def follows
    @user = User.find(params[:id])
  end

  def followers
    @user = User.find(params[:id])
  end
  
  def withdraw
    @user = User.find(params[:id])
    @guest_user = User.find_by(email: "guest@example.com")
    if current_user == @guest_user
      redirect_to root_path
    else
      @user.update(is_valid: false)
      reset_session
      redirect_to root_path
    end
  end

  private
  def user_params
    params.require(:user).permit(:name, :introduction)
  end
end