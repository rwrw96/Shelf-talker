require "rails_helper"
require 'spec_helper'

RSpec.describe User, "モデルに関するテスト", type: :model do
  let(:user) { create(:user) }
  let!(:user2) { FactoryBot.create(:user, id: 2 ,name: "test2", email: "test1@test2") }
  Tmdb::Api.key(ENV['API_KEY'])
  
  describe "新規登録" do
    context "ユーザーの登録成功" do
      it "有効なユーザーのみ保存されるか" do
        expect(FactoryBot.create(:user)).to be_valid
      end
    end

    context "ユーザーの登録失敗" do
      before do
        visit "/users/sign_up"
        fill_in 'registration_name', with: ''
        fill_in 'registration_email', with: ''
        fill_in 'registration_password', with: ''
        fill_in 'registration_password_confirmation', with: ''
        click_button '新規登録'
      end

      it "有効ではないユーザーの場合リダイレクトする" do
        expect(current_path).to eq '/users'
      end
    end
  end


  describe "ユーザー詳細画面" do
    context "バリデーションチェック" do
      before do
        visit "/users/sign_in"
        fill_in 'user[email]', with: user.email
        fill_in 'user[password]', with: user.password
        click_button 'Log in'
      end

      it "ログインユーザーの詳細画面に編集リンクが存在する" do
        visit "/users/#{user.id}"
        expect(page).to have_link "更新"
      end
      it "他ユーザーの詳細画面に編集リンクが存在しない" do
        visit "/users/2"
        expect(page).to have_no_link "更新"
      end
      it "他ユーザーの編集画面に遷移時、映画一覧画面に遷移される" do
        visit "/users/2/edit"
        expect(current_path).to eq "/"
      end
    end


    context "ユーザー編集のバリデーション" do
      before do
        visit "/users/sign_in"
        fill_in 'user[email]', with: user.email
        fill_in 'user[password]', with: user.password
        click_button 'Log in'
        visit "/users/#{user.id}/edit"
        fill_in "edit_name", with: ""
        fill_in "edit_introduction", with: ""
        click_button "更新"
      end

      it "フォームが空の場合更新に失敗する" do
        expect(current_path).to eq "/users/#{user.id}"
        expect(page).to have_content "Nameが未入力です"
      end
    end


    context "ユーザー情報の編集" do
      before do
        visit "/users/sign_in"
        fill_in 'user[email]', with: user.email
        fill_in 'user[password]', with: user.password
        click_button 'Log in'
        visit "/users/#{user.id}/edit"
        fill_in "edit_name", with: "test1"
        fill_in "edit_introduction", with: "test2"
        click_button "更新"
      end

      it "ユーザー情報が更新される" do
        expect(page).to have_content "test1"
        expect(page).to have_content "test2"
      end
    end


    context "フォロー機能" do
      before do
        visit "/users/sign_in"
        fill_in 'user[email]', with: user.email
        fill_in 'user[password]', with: user.password
        click_button 'Log in'
        visit "/users/2"
      end
      
      it "フォローするボタンが存在する" do
        expect(page).to have_content "フォローする"
      end
      it "フォローボタンからフォローできる" do
        expect { click_on 'フォローする' }.to change(user.followings, :count).by(1)
      end
    end


    context "フォロー解除機能" do
      before do
        visit "/users/sign_in"
        fill_in 'user[email]', with: user.email
        fill_in 'user[password]', with: user.password
        click_button 'Log in'
        visit "/users/2"
        click_on "フォローする"
        visit "/users/2"
      end

      it "フォロー済みボタンが存在する" do
        expect(page).to have_content "フォロー済み"
      end
      it "フォロー済みボタンからフォロー解除する" do
        expect { click_on 'フォロー済み' }.to change(user.followings, :count).by(-1)
      end
    end
    
    
    context "退会機能" do
      before do
        visit "/users/sign_in"
        fill_in 'user[email]', with: user.email
        fill_in 'user[password]', with: user.password
        click_button 'Log in'
        visit "/users/#{user.id}"
      end
      
      it "退会ボタンが存在する" do
        expect(page).to have_link "退会する"
      end
      it "押すとis_validがfalseに変わりセッションが削除される" do
        click_on "退会する"
        expect(User.find_by(id: user.id).is_valid).to be_falsey
        expect(current_path).to eq "/"
      end
    end
    
    
    context "他ユーザーを退会させることはできない" do
      before do
        visit "/users/sign_in"
        fill_in 'user[email]', with: user2.email
        fill_in 'user[password]', with: user2.password
        click_button 'Log in'
        visit "/users/#{user.id}"
      end
      it "退会ボタンが存在しない" do
        expect(page).to have_no_link "退会する"
      end
    end
  end
end