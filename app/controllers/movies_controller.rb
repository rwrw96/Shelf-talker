class MoviesController < ApplicationController
  require "themoviedb-api"
  Tmdb::Api.language("ja")
  Tmdb::Api.key(ENV['API_KEY'])
  
  def index
    if Review.find_by(rate: 5).exists?
      top_review = Review.where(rate: 5)
      @top_reviews = top_review.order("RANDOM()").limit(1)
    end
  end
  
  def show 
  @reviews = Review.all
  @review = Review.new
  @movieinfo = JSON.parse((Tmdb::Movie.detail(params[:id])).to_json)
  end
end
