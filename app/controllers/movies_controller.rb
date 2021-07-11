class MoviesController < ApplicationController
  # ログインユーザーのみ許可する
  before_action :authenticate_user!, only: [:show]
  # tmdb APIを取得
  require "themoviedb-api"
  Tmdb::Api.language("ja")
  Tmdb::Api.key(ENV['API_KEY'])

  def index
    #人気映画20件取得
    #15ページの中からランダムで表示
    @popular_movie = JSON.parse((Tmdb::Movie.popular(page: rand(1..15))).to_json)
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
    #idに該当するmovieデータをjson形式で取得
    @detail = JSON.parse((Tmdb::Movie.detail(params[:id])).to_json)
  end
end
