class LikesController < ApplicationController
  def create
    @review = Review.find(params[:id])
    Like.create(user_id: current_user.id, review_id: @review.id)
    
    review = Review.find_by(params[:review_id])
    review.create_notification_like!(current_user)
  end

  def destroy
    @review = Review.find(params[:id])
    Like.find_by(user_id: current_user.id, review_id: @review.id).destroy
  end
end
