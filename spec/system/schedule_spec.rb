require 'rails_helper'
RSpec.describe 'スケジュール管理機能', type: :system do
  let!(:user){FactoryBot.create(:user)}
  let!(:third_user){FactoryBot.create(:third_user)}
  let!(:family){FactoryBot.create(:family)}
  let!(:second_family){FactoryBot.create(:second_family)}
  let!(:group){FactoryBot.create(:group, family: family, user: user)}
  let!(:second_group){FactoryBot.create(:group, family: second_family, user: third_user)}
  let!(:kid){FactoryBot.create(:kid, family: family)}

  describe 'スケジュールCRUD機能' do 
    before do 
      visit new_user_session_path 
        fill_in 'user_email', with: 'test@example.com'
        fill_in 'user_password', with: 'testpass'
        click_on 'commit'
    end 

    context 'スケジュールを登録した場合' do
      it 'スケジュールがカレンダーに登録されている' do
        visit new_schedule_path
				select 'kid1', from: 'schedule_kid_id'
				select_date '2022,10,31', from: '日付'
        select_time '12','00', from: '日付'
        fill_in 'schedule_title', with: '予防接種'
        fill_in 'schedule_content', with: 'ヒブワクチンを接種予定'
				click_on 'commit'
				expect(page).to have_content '予定を登録しました'
      end
    end 

    context 'カレンダーに表示されてある任意の名前をクリックした場合' do
      it 'そのスケジュールの詳細に飛ぶ' do
        FactoryBot.create(:family)
        FactoryBot.create(:kid, family: family)
        FactoryBot.create(:schedule, kid: kid)
        visit schedules_path
        click_link '詳細'
        expect(page).to have_content 'お遊戯会'
      end
    end

    context '任意のスケジュールを編集した場合' do
      it '編集内容が反映されている' do
        FactoryBot.create(:family)
        FactoryBot.create(:kid, family: family)
        FactoryBot.create(:schedule, kid: kid)
        visit schedules_path
        click_link '編集'
        fill_in 'schedule_title', with: '保育園お遊戯会'
        click_on 'commit'
        expect(page).to have_content '保育園お遊戯会'
      end
    end

    context '任意のスケジュールを削除した場合' do
      it 'そのスケジュールが一覧から削除されている' do
        FactoryBot.create(:family)
        FactoryBot.create(:kid, family: family)
        FactoryBot.create(:schedule, title: '市役所', content: '補助金申請', kid: kid)
        visit schedules_path
        click_link '削除'
        page.accept_alert
        expect(page).not_to have_content '市役所'
      end
    end
  end

  describe 'アクセス制限' do 
    before do 
      visit new_user_session_path 
        fill_in 'user_email', with: 'test@example.com'
        fill_in 'user_password', with: 'testpass'
        click_on 'commit'
    end 

    context '他のファミリーがアクセスしようとした場合' do
      it 'アクセス権限がありませんと表示される' do
        FactoryBot.create(:kid, family: family)
        FactoryBot.create(:schedule, title: '予防接種', content: '水疱瘡の予防接種に行く', kid: kid, id: 15)
        visit schedules_path
        click_link 'ログアウト'
        sleep(1)
        visit new_user_session_path
        fill_in 'user_email', with: 'test3@example.com'
        fill_in 'user_password', with: 'test3pass'
        click_on 'commit'
        visit schedule_path(15)
        expect(page).to have_content 'アクセス権限がありません'
      end
    end
  end
end
