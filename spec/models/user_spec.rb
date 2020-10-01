require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'ユーザー新規登録' do
    before do
      @user = FactoryBot.build(:user)
    end

    it '必須入力項目の内容が存在すれば登録できること' do
      expect(@user).to be_valid
    end

    it 'nameが空では登録できない' do
      @user.name = nil
      @user.valid?
      expect(@user.errors.full_messages).to include('ユーザーネームを入力してください')
    end

    it 'nameが11文字以上だと出品できない' do
      @user.name = 'a' * 11
      @user.valid?
      expect(@user.errors.full_messages).to include('ユーザーネームは10文字以内で入力してください')
    end

    it 'emailが空では登録できない' do
      @user.email = nil
      @user.valid?
      expect(@user.errors.full_messages).to include('Eメールを入力してください')
    end

    it 'emailに@が含まれていないと登録できない' do
      @user.email = 'kkk.gmail.com'
      @user.valid?
      expect(@user.errors.full_messages).to include('Eメールは@と.を含むアドレスを入力してください')
    end

    it 'emailに.が含まれていないと登録できない' do
      @user.email = 'kkk@gmailcom'
      @user.valid?
      expect(@user.errors.full_messages).to include('Eメールは@と.を含むアドレスを入力してください')
    end

    it '重複したemailが存在する場合は登録できないこと' do
      @user.save
      another_user = FactoryBot.build(:user, email: @user.email)
      another_user.valid?
      expect(another_user.errors.full_messages).to include('Eメールはすでに存在します')
    end

    it 'passwordが空では登録できない' do
      @user.password = nil
      @user.valid?
      expect(@user.errors.full_messages).to include('パスワードを入力してください')
    end

    it 'passwordと確認passwordが一致していないと登録できない' do
      @user.password_confirmation = ''
      @user.valid?
      expect(@user.errors.full_messages).to include('パスワード（確認用）とパスワードの入力が一致しません')
    end

    it 'passwordが、英字と数字の両方を含めて8文字以上で登録できる' do
      @user.password = 'a12345678'
      @user.password_confirmation = 'a12345678'
      expect(@user).to be_valid
    end

    it 'passwordが7文字以下では登録できない' do
      @user.password = '1234567'
      @user.password_confirmation = '1234567'
      @user.valid?
      expect(@user.errors.full_messages).to include('パスワードには英字と数字の両方を含めて、8文字以上で設定してください')
    end

    it 'passwordが数字のみだと登録できない' do
      @user.password = '123456'
      @user.password_confirmation = '123456'
      @user.valid?
      expect(@user.errors.full_messages).to include('パスワードには英字と数字の両方を含めて、8文字以上で設定してください')
    end

    it 'introductionが201文字以上だと出品できない' do
      @user.introduction = 'a' * 201
      @user.valid?
      expect(@user.errors.full_messages).to include('自己紹介は200文字以内で入力してください')
    end

    it 'relationshipが21文字以上だと出品できない' do
      @user.relationship = 'a' * 21
      @user.valid?
      expect(@user.errors.full_messages).to include('妊婦さんからみた続柄は20文字以内で入力してください')
    end
  end
end
