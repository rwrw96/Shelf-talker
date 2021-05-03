class MoviesController < ApplicationController
  # before_action :move_to_signed_in
  require "themoviedb-api"
  
  
  Tmdb::Api.language("ja")
  Tmdb::Api.key("f666fc01f99324fbc4beea6ae1f0e427")
  
  def index
  end
end
