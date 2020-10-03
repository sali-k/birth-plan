require 'rails_helper'

RSpec.describe Birth, type: :model do
  describe 'バースプラン作成機能' do
    before do
      @birth = FactoryBot.build(:birth)
    end

    it '必要事項が入力されていれば出品できる' do
      expect(@birth).to be_valid
    end

    it 'plan_nameが空では登録できない' do
      @birth.plan_name = nil
      @birth.valid?
      expect(@birth.errors.full_messages).to include('Myバースプラン名を入力してください')
    end

    it 'thoughtが空では登録できない' do
      @birth.thought = nil
      @birth.valid?
      expect(@birth.errors.full_messages).to include('お産に対するイメージや想いを入力してください')
    end

    it 'hope_idが0では登録できない' do
      @birth.hope_id = 0
      @birth.valid?
      expect(@birth.errors.full_messages).to include('立ち合い分娩の希望を選択してください')
    end

    it 'attend_idが0では登録できない' do
      @birth.attend_id = 0
      @birth.valid?
      expect(@birth.errors.full_messages).to include('立ち合い分娩をする人を選択してください')
    end

    it 'contractionが1001文字以上だと出品できない' do
      @birth.contraction = 'a' * 1001
      @birth.valid?
      expect(@birth.errors.full_messages).to include('陣痛中の過ごし方は1000文字以内で入力してください')
    end

    it 'childbirthが1001文字以上だと出品できない' do
      @birth.childbirth = 'a' * 1001
      @birth.valid?
      expect(@birth.errors.full_messages).to include('赤ちゃんが生まれたときにしたいこと（分娩室にて）は1000文字以内で入力してください')
    end

    it 'breastfeeding_idが0では登録できない' do
      @birth.breastfeeding_id = 0
      @birth.valid?
      expect(@birth.errors.full_messages).to include('授乳に対する希望を選択してください')
    end

    it 'postpartumが1001文字以上だと出品できない' do
      @birth.postpartum = 'a' * 1001
      @birth.valid?
      expect(@birth.errors.full_messages).to include('お産後の過ごし方や育児への希望は1000文字以内で入力してください')
    end

    it 'memoが1001文字以上だと出品できない' do
      @birth.memo = 'a' * 1001
      @birth.valid?
      expect(@birth.errors.full_messages).to include('メモは1000文字以内で入力してください')
    end

  end
end
