require 'rails_helper'

RSpec.describe Schedule, type: :model do
  describe 'スケジュール管理機能', type: :model do 

  describe 'バリデーションのテスト' do 
    context 'スケジュールのタイトルが空の場合' do 
      it '有効ではありませんと表示される' do 
        schedule = Schedule.new(title:'', content:'役所に行く')
        expect(schedule).not_to be_valid 
      end
    end 

    context 'スケジュールの内容が空の場合' do 
      it '有効ではありませんと表示される' do 
        schedule = Schedule.new(title:'無償化申請', content:'')
        expect(schedule).not_to be_valid 
      end
    end 
  end
end
