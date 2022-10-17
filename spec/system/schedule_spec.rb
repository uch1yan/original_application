require 'rails_helper'
RSpec.describe 'スケジュール管理機能', type: :system do
  let!(:user){FactoryBot.create(:user)}
  let!(:second_user){FactoryBot.create(:second_user)}
  let!(:schedule){FactoryBot.create(:schedule)}
  let!(:second_schedule){FactoryBot.create(:second_schedule)}

  describe 'ユーザ登録機能' do 
    context 'ユーザーが新規登録をした場合' do
      it '登録ができる' do
        visit new_user_registration_path
				fill_in 'user_name', with: 'dive'
				fill_in 'user_email', with: 'dive@example.com'
        fill_in 'user_password', with: 'divepass'
        fill_in 'user_password_confirmation', with: 'divepass'
				click_on 'Sign up'
				expect(page).to have_content 'Welcome! You have signed up successfully.'
      end
    end 

    context 'ログインせずスケジュール一覧画面に飛ばした場合' do 
      it 'ログイン画面に移動する' do 
        visit schedules_path 
        expect(current_path).to eq new_user_session_path
      end 
    end 
  end 
