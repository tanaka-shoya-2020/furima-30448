require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
    @another_user = FactoryBot.build(:user)
  end

  describe 'ユーザー新規登録' do
    context '新規登録がうまく行く時' do
      it 'name,email,password,password_confirmation,名前(漢字),名前(カタカナ),生年月日が全て条件を満たすと登録できる' do
        expect(@user).to be_valid
      end

      it 'passwordが6文字以上の英数字であれば登録できる' do
        @user.password = 'test1t'
        @user.password_confirmation = 'test1t'
        expect(@user).to be_valid
      end
    end

    context '新規登録がうまくいかないとき' do
      it 'nameが空だと登録できない' do
        @user.name = nil
        @user.valid?
        expect(@user.errors.full_messages).to include("Name can't be blank")
      end

      it 'emailが空だと登録できない' do
        @user.email = nil
        @user.valid?
        expect(@user.errors.full_messages).to include("Email can't be blank")
      end

      it 'emailが重複すると登録できない' do
        @user.save
        @another_user.email = @user.email
        @another_user.valid?
        expect(@another_user.errors.full_messages).to include('Email has already been taken')
      end

      it 'emailに@がないと登録できない' do
        @user.email = 'foobar.gmail.com'
        @user.valid?
        expect(@user.errors.full_messages).to include('Email is invalid')
      end

      it 'passwordが空だと登録できない' do
        @user.password = ''
        @user.password_confirmation = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Password can't be blank")
      end

      it 'password_confirmationが空だと登録できない' do
        @user.password_confirmation = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
      end

      it 'passwordとpassword_confirmationが異なっていると登録できない' do
        @user.password = 'aaaaaa'
        @user.password_confirmation = '111111'
        @user.valid?
        expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
      end

      it 'passwordが5文字以下の英数字だと登録できない' do
        @user.password = 'Aa3aa'
        @user.password_confirmation = 'Aa3aa'
        @user.valid?
        expect(@user.errors.full_messages).to include('Password is too short (minimum is 6 characters)',
                                                      'Password is invalid')
      end

      it 'passwordは英字のみの場合に登録できない' do
        @user.password = 'aaaaaa'
        @user.password_confirmation = 'aaaaaa'
        @user.invalid?
        expect(@user.errors.full_messages).to include('Password is invalid')
      end

      it 'passwordは数字のみの場合に登録できない' do
        @user.password = '111111'
        @user.password_confirmation = '111111'
        @user.invalid?
        expect(@user.errors.full_messages).to include('Password is invalid')
      end

      it 'お名前(全角)の苗字が空だと登録できない' do
        @user.family_name = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Family name can't be blank")
      end

      it 'お名前(全角)の苗字が漢字でないと登録できない' do
        @user.family_name = 'foo'
        @user.valid?
        expect(@user.errors.full_messages).to include('Family name is invalid')
      end

      it 'お名前(全角)の名前が空だと登録できない' do
        @user.first_name = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("First name can't be blank")
      end

      it 'お名前(全角)の名前が漢字でないと登録できない' do
        @user.first_name = 'foo'
        @user.valid?
        expect(@user.errors.full_messages).to include('First name is invalid')
      end

      it 'お名前カナ(全角)の苗字が空だと登録できない' do
        @user.family_name_kana = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Family name kana can't be blank")
      end

      it 'お名前カナ(全角)の苗字がカタカナでないと登録できない' do
        @user.family_name_kana = '佐藤'
        @user.valid?
        expect(@user.errors.full_messages).to include('Family name kana is invalid')
      end

      it 'お名前カナ(全角)の名前が空だと登録できない' do
        @user.first_name_kana = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("First name kana can't be blank")
      end

      it 'お名前カナ(全角)の名前がカタカナでないと登録できない' do
        @user.first_name_kana = '佐藤'
        @user.valid?
        expect(@user.errors.full_messages).to include('First name kana is invalid')
      end

      it '生年月日が空だと登録できない' do
        @user.birthday = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Birthday can't be blank")
      end
    end
  end
end
