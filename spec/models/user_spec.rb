require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'ユーザー管理機能', type: :model do 

  describe 'バリデーションのテスト' do 
    context 'ユーザーの名前が空の場合' do 
      it '有効ではありませんと表示される' do 
        user = User.new(name:'', admin:'false')
        expect(user).not_to be_valid 
      end
    end 
  end
end
