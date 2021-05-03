class ReviewsController < ApplicationController
    
    def show
      @review = Review.find(params[:id])
    end

    def create
      @review = Review.new(review_params)
      @review.user_id = current_user.id
      @review.save!
      redirect_to review_path(@review)
    end

  private
    def review_params
      params.require(:review).permit(:title,
                                     :body,
                                     :rate,
                                     :movie_title,
                                     :release_date,
                                     :overview,
                                     :poster_path,
                                     :tmdb)
    end
end
