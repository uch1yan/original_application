require 'rails_helper'

RSpec.describe Schedule, type: :model do
  describe 'スケジュール管理機能', type: :model do 

  describe 'バリデーションのテスト' do 
    context 'スケジュールの日付が空の場合' do 
      it '有効ではありませんと表示される' do 
        schedule = Schedule.new(start_time:'', title:'無償化申請', content:'役所に行く')
        expect(schedule).not_to be_valid 
      end
    end 

    context 'スケジュールのタイトルが空の場合' do 
      it '有効ではありませんと表示される' do 
        schedule = Schedule.new(start_time:'2022-10-01', title:'', content:'役所に行く')
        expect(schedule).not_to be_valid 
      end
    end 

    context 'スケジュールの内容が空の場合' do 
      it '有効ではありませんと表示される' do 
        schedule = Schedule.new(start_time:'2022-10-01', title:'無償化申請', content:'')
        expect(schedule).not_to be_valid 
      end
    end 
  end
  end
end

