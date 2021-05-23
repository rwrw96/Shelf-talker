require "rails_helper"
require 'spec_helper'

RSpec.describe "モデルに関するテスト", type: :model do
  let(:user) { create(:user) }
  let!(:review) { create(:review, user: user) }
  let!(:review2) { create(:review, rate: 3.0, user: user) }
  
  describe "トップレビューの表示" do
    before do
      Tmdb::Api.key(ENV['API_KEY'])
      visit "/users/sign_in"
      fill_in 'user[email]', with: user.email
      fill_in 'user[password]', with: user.password
      click_button 'Log in'
    end
      
      it "評価5.0(rate: 5.0)のレビューを表示する" do
        expect(page).to have_content review.title
        expect(page).to have_content review.body
      end
      it "評価5.0(rate: 5.0)未満のレビューは表示しない" do
        expect(page).to have_no_content review2.title
        expect(page).to have_no_content review2.body
      end

    end
  end
