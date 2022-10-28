require 'rails_helper'
RSpec.describe '今日の様子管理機能', type: :system do
  let!(:user){FactoryBot.create(:user)}
  let!(:family){FactoryBot.create(:family)}
  let!(:group){FactoryBot.create(:group, family: family, user: user)} 
  let!(:kid){FactoryBot.create(:kid, family: family)}

  describe '今日の様子CRUD機能' do 
    before do 
      visit new_user_session_path 
      fill_in 'user_email', with: 'test@example.com'
      fill_in 'user_password', with: 'testpass'
      click_on 'commit'
    end 

    context '今日の様子を登録した場合' do
      it '今日の様子がカレンダーに登録されている' do
        visit new_daily_condition_path
		select 'kid1', from: 'daily_condition_kid_id'
        fill_in 'daily_condition_start_time', with: '002022-10-05T12:00:00'
        select '良い', from: 'daily_condition_mood'
        fill_in 'daily_condition_temperature', with: '36.5'
        select '快便', from: 'daily_condition_toilet'
        fill_in 'daily_condition_sleep', with: '7時間'
        fill_in 'daily_condition_comment', with: 'テストコメント'
		click_on 'commit'
		expect(page).to have_content '今日の様子を登録しました'
      end
    end 

    context 'カレンダーに表示されてある任意の名前をクリックした場合' do
      it 'その子供の今日の様子の詳細に飛ぶ' do
        FactoryBot.create(:family)
        FactoryBot.create(:kid, family: family)
        FactoryBot.create(:daily_condition, kid: kid)
        visit daily_conditions_path
        click_link 'kid1'
        expect(page).to have_content '名前: kid1'
      end
    end

    context '任意の子供の今日の様子を編集した場合' do
      it '編集内容が反映されている' do
        FactoryBot.create(:family)
        FactoryBot.create(:kid, family: family)
        FactoryBot.create(:daily_condition, kid: kid)
        visit daily_conditions_path
        click_link 'kid1'
        click_link '編集'
        fill_in 'daily_condition_comment', with: 'コメントを変更'
        click_on 'commit'
        expect(page).to have_content '今日の様子を更新しました！'
      end
    end

    context '任意の今日の様子を削除した場合' do
      it 'そのスケジュールが一覧から削除されている' do
        FactoryBot.create(:family)
        FactoryBot.create(:kid, family: family)
        FactoryBot.create(:daily_condition, kid: kid)
        visit daily_conditions_path
        click_link 'kid1'
        click_link '削除'
        page.accept_alert
        expect(page).to have_content '今日の様子を削除しました'
      end
    end
  end

  describe 'アクセス制限' do 
    let!(:third_user){FactoryBot.create(:third_user)}
    let!(:second_family){FactoryBot.create(:second_family)}
    let!(:third_group){FactoryBot.create(:group, family: second_family, user: third_user)} 
    let!(:second_kid){FactoryBot.create(:second_kid, family: second_family)}
    before do 
      visit new_user_session_path 
      fill_in 'user_email', with: 'test@example.com'
      fill_in 'user_password', with: 'testpass'
      click_on 'commit'
      visit new_daily_condition_path
      select 'kid1', from: 'daily_condition_kid_id'
      fill_in 'daily_condition_start_time', with: '002022-10-05T12:00:00'
      select '良い', from: 'daily_condition_mood'
      fill_in 'daily_condition_temperature', with: '36.5'
      select '快便', from: 'daily_condition_toilet'
      fill_in 'daily_condition_sleep', with: '7時間'
      fill_in 'daily_condition_comment', with: 'テストコメント'
      click_on 'commit'
    end 

    context '他のファミリーがアクセスしようとした場合' do
      it 'アクセス権限がありませんと表示される' do
        visit daily_conditions_path
        click_link 'ログアウト'
        sleep(1)
        click_link 'ログイン'
        fill_in 'user_email', with: 'test3@example.com'
        fill_in 'user_password', with: 'test3pass'
        click_on 'commit'
        visit daily_condition_path(DailyCondition.first)
        expect(page).to have_content 'アクセス権限がありません'
      end
    end
  end
end