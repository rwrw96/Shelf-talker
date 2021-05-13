class Admin::UsersController < ApplicationController
  before_action :if_not_admin
  
  def index
    @users = User.all
  end

  def destroy
    @user = User.find(params[:id])
    @user.destroy
    redirect_to admin_users_path
  end
  
  private
  def if_not_admin
    unless current_user.admin?
      redirect_to root_path
    end
  end
end
