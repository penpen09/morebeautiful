require 'rails_helper'
RSpec.describe 'ユーザ管理機能', type: :system do
  # before do
  #   @second_user = FactoryBot.create(:second_user)
  #   @user = FactoryBot.create(:user)
  # end

  describe '新規作成機能' do
    context 'ユーザを新規作成した場合' do
      it '作成したユーザが表示される' do
        visit new_user_registration_path
        fill_in "name", with: 'Suda'
        fill_in "Email address", with: 'suda@suda.com'
        fill_in "Password", with: 'sudamasaki'
        fill_in "Password_confirmation", with: 'sudamasaki'
        click_button "Create"
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

  # describe 'セッション機能' do
  #   context 'ログインしようとすると' do
  #     it 'ログインができること' do
  #       visit new_session_path
  #       fill_in "Email address", with: 'sato@takeru.com'
  #       fill_in "Password", with: 'satotakeru0123'
  #       click_on 'Log in'
  #       expect(page).to have_content 'sato@takeru.com'
  #     end
  #     it '他人の詳細画面に飛ぶとタスク一覧画面に遷移する' do
  #       visit new_session_path
  #       fill_in "Email address", with: 'sato@takeru.com'
  #       fill_in "Password", with: 'satotakeru0123'
  #       click_on 'Log in'
  #       visit user_path(@user.id)
  #       expect(current_path).to eq tasks_path
  #     end
  #     it 'ログアウトができる' do
  #       visit new_session_path
  #       fill_in "Email address", with: 'sato@takeru.com'
  #       fill_in "Password", with: 'satotakeru0123'
  #       click_on 'Log in'
  #       click_on 'ログアウト'
  #       expect(current_path).to eq new_session_path
  #     end
  #   end
  #   context '管理画面に遷移しようとすると' do
  #     it 'タスク一覧に遷移する' do
  #       visit new_session_path
  #       fill_in "Email address", with: 'sato@takeru.com'
  #       fill_in "Password", with: 'satotakeru0123'
  #       click_on 'Log in'
  #       visit admin_users_path
  #       expect(current_path).to eq tasks_path
  #     end
  #   end
  # end


  # describe '管理機能' do
  #   before do
  #     visit new_session_path
  #     fill_in "Email address", with: 'admin@admin.com'
  #     fill_in "Password", with: 'password'
  #     click_on 'Log in'
  #   end
  #   context '管理ユーザ' do
  #     it '管理画面のアクセスできる' do
  #       visit admin_users_path
  #       expect(page).to have_content 'Users'
  #     end
  #     it 'ユーザの新規登録ができる' do
  #       visit admin_users_path
  #       click_on 'new'
  #       fill_in "name", with: 'test'
  #       fill_in "Email address", with: 'test@test.com'
  #       fill_in "Password", with: 'testtest'
  #       fill_in "Password_confirmation", with: 'testtest'
  #       click_button "Create"
  #       expect(page).to have_content 'test@test.com'
  #     end
  #     it 'ユーザの詳細画面にアクセスできる' do
  #       visit admin_user_path(@second_user.id)
  #       expect(page).to have_content 'sato@takeru.com'
  #     end
  #     it 'ユーザの編集画面からユーザを編集できる' do
  #       visit edit_admin_user_path(@second_user.id)
  #       fill_in "name", with: 'SatoTakeru'
  #       fill_in "Email address", with: 'sato@takeru.com'
  #       fill_in "Password", with: 'satotakeru0123'
  #       fill_in "Password_confirmation", with: 'satotakeru0123'
  #       click_on 'Create'
  #       expect(page).to have_content 'sato@takeru.com'
  #     end
  #     it 'ユーザの削除ができる' do
  #       visit admin_users_path
  #       page.accept_confirm do
  #         first('tbody tr').click_on 'delete'
  #       end
  #       expect(page).not_to have_content 'test'
  #     end
  #   end
  #   context '一般ユーザがログイン時' do
  #     it '管理画面にアクセスできない' do
  #       click_on 'ログアウト'
  #       visit new_session_path
  #       fill_in "Email address", with: 'sato@takeru.com'
  #       fill_in "Password", with: 'satotakeru0123'
  #       click_on 'Log in'
  #       visit admin_users_path
  #       expect(current_path).to eq tasks_path
  #     end
  #   end
  # end
end
