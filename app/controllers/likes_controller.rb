class LikesController < ApplicationController
  def create
    @review = Review.find(params[:id])
    Like.create(user_id: current_user.id, review_id: @review.id)
  end

  def destroy
    @review = Review.find(params[:id])
    Like.find_by(user_id: current_user.id, review_id: @review.id).destroy
  end
end
