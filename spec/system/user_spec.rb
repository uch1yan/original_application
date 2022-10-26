require 'rails_helper'
RSpec.describe 'ユーザ管理機能', type: :system do
  let!(:user){FactoryBot.create(:user)}
  let!(:admin_user){FactoryBot.create(:admin_user)}

  describe 'ユーザ登録機能' do 
    context 'ユーザーが新規登録をした場合' do
      it '登録ができる' do
        visit new_user_registration_path
				fill_in 'user_name', with: 'dive'
				fill_in 'user_email', with: 'dive@example.com'
        fill_in 'user_password', with: 'divepass'
        fill_in 'user_password_confirmation', with: 'divepass'
				click_on 'Sign up'
				expect(page).to have_content 'アカウント登録が完了しました。'
      end
    end 

    context 'ログインせずスケジュール一覧画面に飛ばした場合' do 
      it 'ログイン画面に移動する' do 
        visit schedules_path 
        expect(current_path).to eq new_user_session_path
      end 
    end 
  end 

  describe 'セッション機能のテスト' do 
    before do 
      visit new_user_session_path 
        fill_in 'user_email', with: 'test@example.com'
        fill_in 'user_password', with: 'testpass'
        click_on 'commit'
    end 

    context '一般ユーザーがログインしたとき' do
      it 'ログインができること' do 
        expect(page).to have_content 'ログインしました。'
      end 

      it 'ログアウトができること' do
        visit users_sign_out_path
        expect(current_path).to have_content 'ログアウトしました。'
      end 
    end 
  end 

  describe '管理者画面機能' do
    before do
      visit new_user_session_path
      fill_in 'user_email', with: 'admin@example.com'
      fill_in 'user_password', with: 'adminpass'
      click_button 'Log in'
    end

    context '管理者ユーザの場合' do
      it '管理画面に遷移できる' do
        click_on '管理者画面'
        expect(current_path).to eq rails_admin_path
      end
    end
  end

end

