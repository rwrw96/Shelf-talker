# frozen_string_literal: true

class Admin::ReviewsController < ApplicationController
  before_action :if_not_admin

  def index
    @q = Review.ransack(params[:q])
    @reviews = @q.result.page(params[:page]).per(8)
  end

  def destroy
    @review = Review.find(params[:id])
    @review.destroy
    redirect_to admin_reviews_path
  end

  private
  # 管理者ではない時リダイレクトされる
  def if_not_admin
    redirect_to root_path unless current_user.admin?
  end
end
