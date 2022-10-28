require 'rails_helper'
RSpec.describe '成長記録管理機能', type: :system do
  let!(:user){FactoryBot.create(:user)}
  let!(:family){FactoryBot.create(:family)}
  let!(:family2){FactoryBot.create(:second_family)}
  let!(:group){FactoryBot.create(:group, family: family, user: user)}
  let!(:user2){FactoryBot.create(:second_user)}
  let!(:group2){FactoryBot.create(:second_group, family: family2, user: user2)} 
  let!(:kid){FactoryBot.create(:kid, family: family)}

  describe '成長記録CRUD機能' do 
    before do 
      visit new_user_session_path 
      fill_in 'user_email', with: 'test@example.com'
      fill_in 'user_password', with: 'testpass'
      click_on 'commit'
    end 

    context '成長記録を入力し、登録をクリックした場合' do
      it '成長記録が登録されている' do
        visit growth_records_path
        click_on '成長記録を登録する'
        select 'kid1', from: 'growth_record_kid_id'
        select_date '2022,10,31', from: '日付'
        fill_in 'growth_record_height', with: '100'
        fill_in 'growth_record_weight', with: '15'
		click_on 'commit'
        expect(page).to have_content '成長記録を登録しました！'
      end
    end 

    context '成長記録の詳細を閲覧するをクリックした場合' do
      it '詳細画面に飛ぶ' do
        visit growth_records_path
        click_on '成長記録を登録する'
		select 'kid1', from: 'growth_record_kid_id'
		select_date '2022,10,31', from: '日付'
        fill_in 'growth_record_height', with: '100'
        fill_in 'growth_record_weight', with: '15'
		click_on 'commit'
        click_on '成長記録の詳細を閲覧する'
        expect(page).to have_content '成長記録の詳細'
      end
    end

    context '任意の成長記録を編集した場合' do
      it '編集内容が反映されている' do
        visit growth_records_path
        click_on '成長記録を登録する'
		select 'kid1', from: 'growth_record_kid_id'
		select_date '2022,10,31', from: '日付'
        fill_in 'growth_record_height', with: '100'
        fill_in 'growth_record_weight', with: '15'
		click_on 'commit'
        click_on '成長記録の詳細を閲覧する'
        click_link '編集'
        fill_in 'growth_record_height', with: '120'
        click_on 'commit'
        expect(page).to have_content '成長記録を更新しました！'
        expect(page).to have_content '120'
      end
    end

    context '任意の成長記録を削除した場合' do
      it 'その成長記録が詳細から削除されている' do
        visit growth_records_path
        click_on '成長記録を登録する'
		select 'kid1', from: 'growth_record_kid_id'
		select_date '2022,10,31', from: '日付'
        fill_in 'growth_record_height', with: '100'
        fill_in 'growth_record_weight', with: '15'
		click_on 'commit'
        click_on '成長記録の詳細を閲覧する'
        click_link '削除'
        page.accept_alert
        expect(page).not_to have_content '2022-10-31'
      end
    end
  end
end