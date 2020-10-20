require 'rails_helper'
RSpec.describe 'ユーザ管理機能', type: :system do
  describe '新規作成機能' do
    context 'ユーザを新規作成した場合' do
      it '作成したユーザが表示される' do
        visit new_user_registration_path
        fill_in "Email address", with: 'suda@suda.com'
        fill_in "Password", with: 'sudamasaki'
        fill_in "Password確認", with: 'sudamasaki'
        click_button "アカウント登録"
        expect(page).to have_content '本人確認用のメールを送信しました'
      end
    end
    context 'ユーザがログインせずイベントを作成しようとした場合' do
      it 'ログイン画面に遷移する' do
        visit new_event_path
        expect(current_path).to eq new_user_session_path
      end
    end
  end

  describe 'セッション機能' do
    before do
      @user = FactoryBot.create(:user)
      @user.skip_confirmation!
      @user.save!
      @admin = FactoryBot.create(:admin)
      @admin.skip_confirmation!
      @admin.save!
    end
    context 'ログインしようとすると' do
      it 'ログインができる' do
        visit new_user_session_path
        fill_in "Email address", with: 'user_1r@example.com'
        fill_in "Password", with: 'password1'
        click_on 'ログイン'
        expect(page).to have_content 'ログインしました'
      end
      it 'マイページに飛べる' do
        visit new_user_session_path
        fill_in "Email address", with: 'user_1r@example.com'
        fill_in "Password", with: 'password1'
        click_on 'ログイン'
        visit user_path(@user.id)
        expect(page).to have_content 'user_1r@example.com'
      end
      it 'ログアウトができる' do
        visit new_user_session_path
        fill_in "Email address", with: 'user_1r@example.com'
        fill_in "Password", with: 'password1'
        click_on 'ログイン'
        # find(".navbar-toggler-icon").click
        click_on 'ログアウト'
        expect(current_path).to eq root_path
      end
    end
    context '管理者が管理画面に' do
      it '遷移できる' do
        visit new_user_session_path
        fill_in "Email address", with: 'admin@example.com'
        fill_in "Password", with: 'passwordadmin'
        click_on 'ログイン'
        click_on '管理画面'
        expect(page).to have_content 'サイト管理'
      end
    end
  end
end
