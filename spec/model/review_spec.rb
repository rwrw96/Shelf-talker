require "rails_helper"
require 'spec_helper'

RSpec.describe Review, "モデルに関するテスト", type: :model do
  let(:user) { create(:user) }
  let!(:review) { create(:review, user: user) }

  context "レビュー投稿時" do
    before do
      visit "/users/sign_in"
      fill_in 'user[email]', with: user.email
      fill_in 'user[password]', with: user.password
      click_button 'Log in'
    end

    it "成功時、レビュー詳細画面に遷移" do
      @popular_movie = JSON.parse(Tmdb::Movie.popular.to_json)
      visit "/movies/#{@popular_movie['table']['results'][0]['table']['id']}"

      fill_in "review_title", with: "レビューのタイトルです"
      fill_in "review_body", with: "レビューの内容です"
      find('#evaluate_star', visible: false, match: :prefer_exact).set(5.0)
      find('#movie_title', visible: false).set(@popular_movie['table']['results'][0]['table']['title'])
      find('#release_date', visible: false).set(@popular_movie['table']['results'][0]['table']['release_date'])
      find('#overview', visible: false).set(@popular_movie['table']['results'][0]['table']['overview'])
      find('#poster_path', visible: false).set(@popular_movie['table']['results'][0]['table']['poster_path'])
      find('#tmdb', visible: false).set(@popular_movie['table']['results'][0]['table']['id'])

      click_button 'レビュー'
      expect(current_path).to eq '/reviews/' + Review.last.id.to_s
    end

    it "title,body,rateが空の時、投稿されずにリダイレクト" do
      @popular_movie = JSON.parse(Tmdb::Movie.popular.to_json)
      visit "/movies/#{@popular_movie['table']['results'][0]['table']['id']}"

      fill_in "review_title", with: ""
      fill_in "review_body", with: ""
      find('#evaluate_star', visible: false, match: :prefer_exact).set("")
      find('#movie_title', visible: false).set(@popular_movie['table']['results'][0]['table']['title'])
      find('#release_date', visible: false).set(@popular_movie['table']['results'][0]['table']['release_date'])
      find('#overview', visible: false).set(@popular_movie['table']['results'][0]['table']['overview'])
      find('#poster_path', visible: false).set(@popular_movie['table']['results'][0]['table']['poster_path'])
      find('#tmdb', visible: false).set(@popular_movie['table']['results'][0]['table']['id'])

      click_button 'レビュー'
      expect(current_path).to eq "/movies/#{@popular_movie['table']['results'][0]['table']['id']}"
      expect(page).to have_content "全て入力してください"
    end
  end

  describe "レビュー詳細画面の内容" do
    before do
      visit "/users/sign_in"
      fill_in 'user[email]', with: user.email
      fill_in 'user[password]', with: user.password
      click_button 'Log in'
      visit "/reviews/#{review.id}"
    end

    it "レビューのタイトルが表示されている" do
      expect(page).to have_content review.title
    end

    it "レビューの内容が表示されている" do
      expect(page).to have_content review.body
    end

    context "レビューの保存・削除" do
      it "保存しますか？を押した時レビューが保存される" do
        expect { click_on '保存しますか？' }.to change(review.likes, :count).by(1)
      end

      it "保存済みを押した時保存したデータを削除する" do
        click_on "保存しますか？"
        click_on "保存済"
        expect(Like.where(id: review.id).count).to eq 0
      end
    end
  end
end
