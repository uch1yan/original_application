require 'rails_helper'

RSpec.describe Kid, type: :model do
  describe '子供管理機能', type: :model do 

  describe 'バリデーションのテスト' do 
    context '子供の名前が空の場合' do 
      it '有効ではありませんと表示される' do 
        kid = Kid.new(kid_name:'', date_of_birth:'2020-01-01')
        expect(kid).not_to be_valid 
      end
    end 

    context '子供の生年月日が空の場合' do 
      it '有効ではありませんと表示される' do 
        kid = Kid.new(kid_name:'Taro', date_of_birth:'')
        expect(kid).not_to be_valid 
      end
    end 
  end
  end
end
