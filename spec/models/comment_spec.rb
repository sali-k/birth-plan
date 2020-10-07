require 'rails_helper'

RSpec.describe Comment, type: :model do
  describe 'コメント機能' do
    before do
      @comment = FactoryBot.build(:comment)
    end

    it 'コメントできる' do
      expect(@comment).to be_valid
    end

    it 'contentが空では登録できない' do
      @comment.content = nil
      @comment.valid?
      binding.pry
      expect(@comment.errors.full_messages).to include('Myバースプラン名を入力してください')
    end
  end
end