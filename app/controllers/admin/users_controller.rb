# frozen_string_literal: true

class Admin::UsersController < ApplicationController
  before_action :if_not_admin

  def index
    @q = User.ransack(params[:q])
    @users = @q.result
  end

  def destroy
    @user = User.find(params[:id])
    @user.destroy
    redirect_to admin_users_path
  end

  private
  # 管理者ではない時リダイレクトする
  def if_not_admin
    redirect_to root_path unless current_user.admin?
  end
end
