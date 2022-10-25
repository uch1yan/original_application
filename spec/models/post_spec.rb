require 'rails_helper'

RSpec.describe Post, type: :model do
  describe 'メモ管理機能', type: :model do 

  describe 'バリデーションのテスト' do 
    context 'メモの日付が空の場合' do 
      it '有効ではありませんと表示される' do 
        post = Post.new(date:'', content:'支払い')
        expect(post).not_to be_valid 
      end
    end 

    context 'メモの内容が空の場合' do 
      it '有効ではありませんと表示される' do 
        post = Post.new(date:'2022-11-01', content:'')
        expect(post).not_to be_valid 
      end
    end 
  end
  end
end
