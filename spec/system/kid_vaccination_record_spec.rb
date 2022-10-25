# require 'rails_helper'
# RSpec.describe '予防接種管理機能', type: :system do
#   let!(:user){FactoryBot.create(:user, email: 'useremail@example.com')}
#   let!(:admin_user){FactoryBot.create(:admin_user)}
#   let!(:family){FactoryBot.create(:family)}
#   let!(:group){FactoryBot.create(:group, family: family, user: user)} 
#   let!(:kid){FactoryBot.create(:kid, family: family)}
  

#   describe '予防接種登録機能' do 
#     before do 
#       visit new_user_session_path 
#         fill_in 'user_email', with: 'useremail@example.com'
#         fill_in 'user_password', with: 'testpass'
#         click_on 'commit'
#       end 

#     context '(登録)ユーザーが子供の予防接種記録を登録した場合' do
#       it '登録ができ、一覧画面に表示されている' do
#         visit new_kid_vaccination_record_path
#         select 'kid1', from: 'kid_vaccination_record_kid_id'
#         # binding.pry
# 				select 'ヒブ', from: 'kid_vaccination_record_vaccination_record'
#         select '1回目', from: 'kid_vaccination_record_count'
#         fill_in 'kid_vaccination_record_inplemented_date', with: '002022-12-01'
# 				click_on 'commit'
# 				expect(page).to have_content '予防接種記録を登録しました！'
#       end
#     end 

#     context '(詳細)任意の予防接種情報をクリックした場合' do 
#       it 'その詳細に飛ぶ' do 
#         FactoryBot.create(:family)
#         FactoryBot.create(:kid, family: family)
#         FactoryBot.create(:vaccination_record)
#         FactoryBot.create(:kid_vaccination_record, vaccination_record: vaccination_record, kid: kid)
#         visit kid_vaccination_records_path 
#         visit kid_vaccination_record_path(@kid_vaccination_record)
#         expect(pege).to have_content '2022/12/01'
#       end 
#     end 

#   #   context '(編集)任意の予防接種情報を編集した場合' do
#   #     it '編集内容が反映されている' do
#   #       FactoryBot.create(:kid_vaccination_record)
#   #       visit kid_vaccination_records_path 
#   #       click_link '編集'   
#   #       fill_in 'kid_vaccination_record_inplemented_date', with: '2022/01/02'
#   #       click_button 'commit'
#   #       expect(page).to have_content '2022/01/02'
#   #     end
#   #   end

#   #   context '(削除)任意の予防接種情報を削除した場合' do
#   #     it '情報が削除されている' do
#   #       FactoryBot.create(:kid_vaccination_record)
#   #       visit kid_vaccination_records_path 
#   #       click_link '削除'   
#   #       page.accept_alert
#   #       expect(page).not_to have_content 'ヒブ' && '一回目'
#   #     end
#   #   end
#   # end 

#   # describe 'ソート機能' do
#   #   context '接種日をクリックした場合' do
#   #     it '昇順に並べ替えられる' do
#   #       FactoryBot.create(:kid_vaccination_record)
#   #       FactoryBot.create(:second_kid_vaccination_record)
#   #       visit kid_vaccination_records_path 
#   #       click_link '接種日'
#   #       vaccine_list = all('.vaccine_row') 
#   #       expect(task_list[0]).to have_content '2022/12/01'
#   #       expect(task_list[1]).to have_content '2022/02/01'
#   #     end
#   #   end
#   # end

#   # describe 'アクセス制限機能' do

#   #   context '他のファミリーがアクセスしようとした場合' do
#   #     it 'アクセス権限がありませんと表示される' do
#   #       FactoryBot.create(:user)
#   #       visit edit_kid_vaccination_record_path
#   #       expect(page).to have_content 'アクセス権限がありません'
#   #     end
#   #   end
#   end
# end


