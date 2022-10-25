require 'rails_helper'

RSpec.describe Family, type: :model do
  describe '家族管理機能', type: :model do 

  describe 'バリデーションのテスト' do 
    context '家族の名前が空の場合' do 
      it '有効ではありませんと表示される' do 
        family = Family.new(name:'')
        expect(family).not_to be_valid 
      end
    end 
  end
  end
end
