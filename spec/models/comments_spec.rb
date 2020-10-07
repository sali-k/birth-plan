require 'rails_helper'

RSpec.describe Comments, type: :model do
  describe 'コメント機能' do
    before do
      @comment = FactoryBot.build(:comment)
    end

    it 'コメントできる' do
      expect(@comment).to be_valid
    end

    it 'plan_nameが空では登録できない' do
      @birth.plan_name = nil
      @birth.valid?
      expect(@birth.errors.full_messages).to include('Myバースプラン名を入力してください')
    end
  end
end