require "rails_helper"
require 'spec_helper'

RSpec.describe Review, "モデルに関するテスト", type: :model do
  let(:user) { create(:user) }
  let!(:review) { create(:review, user: user) }

  describe "人気映画一覧表示" do
    context "ユーザーがサインインするとき" do
      before do
        visit "/users/sign_in"
        fill_in 'user[email]', with: user.email
        fill_in 'user[password]', with: user.password
        click_button 'Log in'
      end

      it "人気映画一覧表示(0~19)" do
        @popular_movie = JSON.parse(Tmdb::Movie.popular.to_json)
        expect(page).to have_content @popular_movie['table']['results'][0]['table']['title']
        expect(page).to have_content @popular_movie['table']['results'][19]['table']['title']
      end

      context "映画をクリックした時" do
        it "映画詳細画面に遷移" do
          @popular_movie = JSON.parse(Tmdb::Movie.popular.to_json)
          click_on @popular_movie['table']['results'][0]['table']['title']
          expect(current_path).to eq "/movies/#{@popular_movie['table']['results'][0]['table']['id']}"
        end
      end
    end
  end
end
