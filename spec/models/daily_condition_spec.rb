require 'rails_helper'

RSpec.describe Schedule, type: :model do
  describe '今日の様子管理機能', type: :model do 

  describe 'バリデーションのテスト' do 
    context '今日の様子の日付が空の場合' do 
      it '有効ではありませんと表示される' do 
        daily_condition = DailyCondition.new(start_time:'', mood:'良い', temperature:'36.5', toilet:'快便', sleep:'7時間', comment: "よく眠った")
        expect(daily_condition).not_to be_valid 
      end
    end 

    context '今日の様子の機嫌が空の場合' do 
      it '有効ではありませんと表示される' do 
        daily_condition = DailyCondition.new(start_time:'2022-01-01',mood:'', temperature:'36.5', toilet:'快便', sleep:'7時間', comment: "よく眠った")
        expect(daily_condition).not_to be_valid 
      end
    end 

    context '今日の様子の排便が空の場合' do 
      it '有効ではありませんと表示される' do 
        daily_condition = DailyCondition.new(start_time:'2022-01-01',mood:'良い', temperature:'36.5', toilet:'', sleep:'7時間', comment: "よく眠った")
        expect(daily_condition).not_to be_valid 
      end
    end 

    context '今日の様子の睡眠が空の場合' do 
      it '有効ではありませんと表示される' do 
        daily_condition = DailyCondition.new(start_time:'2022-01-01',mood:'良い', temperature:'36.5', toilet:'快便', sleep:'', comment: "よく眠った")
        expect(daily_condition).not_to be_valid 
      end
    end 
  end
  end
end

