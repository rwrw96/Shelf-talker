class Admin::ReviewsController < ApplicationController
  before_action :if_not_admin

  def index
    @reviews = Review.all
  end
  
  def destroy
    @review = Review.find(params[:id])
    @review.destroy
    redirect_to admin_reviews_path
  end
  
  private
  def if_not_admin
    unless current_user.admin?
      redirect_to root_path
    end
  end
end
