require 'rails_helper'

RSpec.describe GrowthRecord, type: :model do
  describe '成長記録管理機能', type: :model do 

  describe 'バリデーションのテスト' do 
    context '成長記録の日付が空の場合' do 
      it '有効ではありませんと表示される' do 
        growth_record = GrowthRecord.new(date:'', height:'100', weight:'20')
        expect(growth_record).not_to be_valid 
      end
    end 

    context '成長記録の身長が空の場合' do 
      it '有効ではありませんと表示される' do 
        growth_record = GrowthRecord.new(date:'2022-12-01', height:'', weight:'20')
        expect(growth_record).not_to be_valid 
      end
    end 

    context '成長記録の体重が空の場合' do 
      it '有効ではありませんと表示される' do 
        growth_record = GrowthRecord.new(date:'2022-12-01', height:'100', weight:'')
        expect(growth_record).not_to be_valid 
      end
    end 
  end
  end
end

