require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end

  describe 'ユーザー新規登録' do
    context '新規登録できない場合' do
      it 'ネームが必須であること' do
        @user.name = ''
        @user.valid?
        expect(@user.errors[:name]).to include("can't be blank")
      end

      it 'メールアドレスが必須であること' do
        @user.email = ''
        @user.valid?
        expect(@user.errors[:email]).to include("can't be blank")
      end

      it 'メールアドレスが一意性であること' do
        existing_user = FactoryBot.create(:user, email: 'test@example.com')
        @user.email = 'test@example.com'
        expect { @user.save! }.to raise_error(/Email has already been taken/)
      end

      it 'メールアドレスは、@を含む必要があること' do
        @user.email = 'invalid_email'
        @user.valid?
        expect(@user.errors[:email]).to include('is invalid')
      end

      it 'パスワードが必須であること' do
        @user.password = ''
        @user.valid?
        expect(@user.errors[:password]).to include("can't be blank")
      end

      it 'パスワードは、6文字以上での入力が必須であること' do
        @user.password = 'passw'
        @user.valid?
        expect(@user.errors[:password]).to include('is too short (minimum is 6 characters)')
      end

      it 'パスワードとパスワード（確認）は、値の一致が必須であること' do
        @user.password_confirmation = 'mismatched_password'
        @user.valid?
        expect(@user.errors[:password_confirmation]).to include("doesn't match Password")
      end

      it 'プロフィールが必須であること' do
        @user.profile = ''
        @user.valid?
        expect(@user.errors[:profile]).to include("can't be blank")
      end

      it '所属が必須であること' do
        @user.occupation = ''
        @user.valid?
        expect(@user.errors[:occupation]).to include("can't be blank")
      end

      it '役職が必須であること' do
        @user.position = ''
        @user.valid?
        expect(@user.errors[:position]).to include("can't be blank")
      end
    end
    
    context '新規登録できる場合' do
      it '適切なデータが存在すれば登録できる' do
        expect(@user).to be_valid
      end
    end
  end
end
