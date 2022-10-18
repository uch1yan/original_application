#CRUD機能
  #予防接種情報を登録した場合、情報が一覧画面に登録されている
  #任意の予防接種情報をクリックすると、その詳細に飛ぶ
  #任意の予防接種情報を編集した場合、編集内容が反映されている
  #任意の予防接種情報を削除した場合、その情報がカレンダーから削除されている

#ソート機能
  #回数にソート機能を使用した場合、昇順から降順に並べ替えられる
  #名前にソート機能を使用した場合、子供の名前ごとに並べ替えられる

#アクセス制限
  #他のユーザーの予防接種情報に飛ぼうとするとアクセス制限がありませんと表示される

require 'rails_helper'
RSpec.describe '予防接種管理機能', type: :system do
  let!(:user){FactoryBot.create(:user)}
  let!(:admin_user){FactoryBot.create(:admin_user)}

  describe '予防接種登録機能' do 
    before do 
      visit new_user_session_path 
        fill_in 'user_email', with: 'test@example.com'
        fill_in 'user_password', with: 'testpass'
        click_on 'commit'
    end 

    context 'ユーザーが子供の予防接種記録を登録した場合' do
      it '登録ができ、一覧画面に表示されている' do
        visit new_kid_vaccination_record_path
        select '[kid_id]', from 'kid_vaccination_record_kid_id'
				select '[vaccination_record_id]', from 'kid_vaccination_record_vaccination_record_id'
        select '[count]', from 'kid_vaccination_record_count'
        fill_in 'kid_vaccination_record_inplemented_date', with: '2022/01/01'
				click_on 'commit'
				expect(page).to have_content 'vaccine was successfully created.'
      end
    end 

    context '任意の予防接種情報をクリックした場合' do 
      it 'その詳細に飛ぶ' do 
        FactoryBot.create(:kid_vaccination_record)
        visit kid_vaccination_records_path 
        visit kid_vaccination_record_path(@kid_vaccination_record)
        expect(current_path).to eq kid_vaccination_record_path(id:1)
      end 
    end 

    context '任意の予防接種情報を編集した場合' do
      it '編集内容が反映されている' do
        FactoryBot.create(:kid_vaccination_record)
        visit kid_vaccination_records_path 
        click_link '編集'   
        fill_in 'kid_vaccination_record_inplemented_date', with: '2022/01/02'
        click_button 'commit'
        expect(page).to have_content '2022/01/02'
      end
    end

    context '任意の予防接種情報を削除した場合' do
      it '情報が削除されている' do
        FactoryBot.create(:kid_vaccination_record)
        visit kid_vaccination_records_path 
        click_link '編集'   
        fill_in 'kid_vaccination_record_inplemented_date', with: '2022/01/02'
        click_button 'commit'
        expect(page).to have_content '2022/01/02'
      end
    end

  end 
