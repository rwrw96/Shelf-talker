class ReviewsController < ApplicationController
  before_action :authenticate_user!, only: [:show, :edit, :index]
    def edit
      @review = Review.find(params[:id])
      if @review.user != current_user
        redirect_to review_path(@review)
      end
    end
  
    def update
      @review = Review.find(params[:id])
      if @review.update(review_params)
      redirect_to review_path(@review)
      else
        flash[:notice] = "全て入力してください"
        render :edit
      end
    end
    
    def show
      @review = Review.find(params[:id])
    end

    def create
      @review = Review.new(review_params)
      @review.user_id = current_user.id
      if @review.save
        redirect_to review_path(@review)
      else
        flash[:notice] = "全て入力してください"
        redirect_to detail_path(@review.tmdb)
      end
    end
    
    def destroy
      @review = Review.find(params[:id])
      @review.destroy
      redirect_to reviews_path
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
