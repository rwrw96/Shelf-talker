require "rails_helper"
require 'spec_helper'

RSpec.describe User, "管理者モデルに関するテスト", type: :model do
  
  let!(:admin) { create(:user, admin: true) }
  let!(:user) { create(:user) }
  let!(:review) { create(:review, user: user) }
  
  
  
  describe "管理者権限で任意のユーザー、レビューを削除することができる" do
    context "管理者としてログインする" do
      before do 
        Tmdb::Api.key(ENV['API_KEY'])
        visit "/users/sign_in"
        fill_in 'user[email]', with: admin.email
        fill_in 'user[password]', with: admin.password
        click_button 'Log in'
      end
      
      it "ユーザー一覧ページに削除リンクが存在している" do
        expect(User.find_by(id: admin.id).admin).to be_truthy
        visit "/admin/users"
        expect(page).to have_link "削除"
      end
      it "押すとユーザーが削除される" do
        visit "/admin/users"
        click_link "削除"
        expect(User.where(id: user.id).count).to eq 0
      end
  
      it "レビュー一覧ページに削除リンクが存在している" do
        visit "/admin/reviews"
        expect(page).to have_link "削除"
      end
      it "押すとレビューが削除される" do
        visit "/admin/reviews"
        click_link "削除"
        expect(Review.where(user_id: user.id).count).to eq 0
      end
    end
    
    
    context "管理者以外でログイン時削除ができない" do
      before do
        visit "/users/sign_in"
        fill_in 'user[email]', with: user.email
        fill_in 'user[password]', with: user.password
        click_button 'Log in'
      end
    
      it "ユーザー一覧ページに削除ボタンが存在しない" do
        visit "/users"
        expect(page).to have_no_link "削除"
      end
      it "レビュー一覧ページに削除ボタンが存在しない" do
        visit "/reviews"
        expect(page).to have_no_link "削除"
      end
    end
  end
end