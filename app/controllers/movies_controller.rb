class MoviesController < ApplicationController
  require "themoviedb-api"
  Tmdb::Api.language("ja")
  Tmdb::Api.key(ENV['API_KEY'])
  
  def index
  end
  
  def show 
  @reviews = Review.all
  @review = Review.new
  @movieinfo = JSON.parse((Tmdb::Movie.detail(params[:id])).to_json)
  end
end
