class MoviesController < ApplicationController
  # ログインユーザーのみ許可する
  before_action :authenticate_user!, only: [:show]
  # tmdb APIを取得
  require "themoviedb-api"
  Tmdb::Api.language("ja")
  Tmdb::Api.key(ENV['API_KEY'])

  def index
    # 評価(rate)が5のレビューがあるならばランダムで一つ取得する
    if Review.find_by(rate: 5)
      top_review = Review.where(rate: 5)
      rand = Rails.env.production? ? "RAND()" : "RANDOM()"
      @top_reviews = top_review.order(rand).limit(1)
    end
  end
  
  def show
    @reviews = Review.all
    @review = Review.new
    @movieinfo = JSON.parse(Tmdb::Movie.detail(params[:id]).to_json)
  end
end
