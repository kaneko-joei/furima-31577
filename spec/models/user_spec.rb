require 'rails_helper'

RSpec.describe User, type: :model do
   before do
    @user = FactoryBot.build(:user)
   end
   
  context '新規登録がうまくいくとき' do
    it 'nicknameとemail、passwordとpassword_confirmation、family_namefirst_name、family_name_kana、first_name_kana、birth_dateが存在すれば登録できる' do
      expect(@user).to be_valid
    end

    it "passwordが6文字以上であれば登録できること" do
      user = build(:user, password: "1234aa", password_confirmation: "1234aa")
      user.valid?
      expect(user).to be_valid
    end


  end


  context '新規登録がうまくいかないとき'
   it 'password:半角英数混合(半角英語のみ)' do
     @user.password = 'aaaaaaa'
     @user.valid?
     expect(@user.errors.full_messages).to include('Password Include both letters and numbers')
   end

    it 'nicknameが空では登録できない' do 
      @user.nickname = ''  
      @user.valid?
      expect(user.errors.full_messages).to include "Nickname can't be blank"
    end

    it 'family_nameが空では登録できない' do 
      @user.family_name = ''  
      @user.valid?
      expect(user.errors.full_messages).to include "Family_name can't be blank"
    end

    it 'first_nameが空では登録できない' do 
      @user.first_name = ''  
      @user.valid?
      expect(user.errors.full_messages).to include "First_name can't be blank"
    end

    it 'family_nameが半角文字だと登録できないこと' do 
      @user.family_name = 'ああ'  
      @user.valid?
      expect(user.errors.full_messages).to include "Family_name can't be blank"
    end

    it 'first_nameが半角文字だと登録できないこと' do 
      @user.first_name = 'いい'  
      @user.valid?
      expect(user.errors.full_messages).to include "First_name can't be blank"
    end

    it 'emailが空では登録できない' do
      # @user.email = '' .math(/@+/)
      @user.email = ''
      @user.valid?
      expect(user.errors.full_messages).to include "Email can't be blank"
    end

    it "重複したemailが存在する場合登録できないこと" do
      user = create(:user)
      another_user = build(:user)
      another_user.valid?
      expect(another_user.errors[:email]).to include("has already been taken")
    end
 
    it '@なしでは登録できない' do
      @user.email = 'test.com'
      @user.valid?
      expect(user.errors.full_messages).to include （"e-mail cannot be registered without @"）
    end

    it 'passwordが英数字のみのとき登録できない' do
      @user.password = 'aa11'
      @user.valid?
      expect(another_user.errors[:email]).to include("Cannot register when password is only alphanumeric")
    end

    it 'passwordが数値のみのとき登録できない' do
      @user.password = '111'
      @user.valid?
      expect(another_user.errors[:email]).to include("Cannot register when password is only a number")
    end

    it 'passwordが空では登録できないこと' do
      @user.password = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Password can't be blank")
    end

    it 'パスワードとパスワード（確認用）は、値の一致が必須であること' do
      @user.password = 'aaa111'
      @user.password_confirmation = 'bbb222'
      @user.valid?
      expect(@user.errors.full_messages).to include("Password and password for confirmation must match values")
    end
  
    it 'パスワードは、6文字以上での入力が必須であること' do
      @user.password = 'aa111'
      @user.valid?
      expect(@user.errors.full_messages).to include("Password must be entered with at least 6 characters")
    end
    
    it '半角数字のみでは登録できない' do
      @user.password = 'aa'
      @user.valid?
      expect(@user.errors.full_messages).to include("Password cannot be registered with only half-width numbers")
    end

    it '全角では登録できないこと' do
      @user.password = 'ａａ'
      @user.valid?
      expect(@user.errors.full_messages).to include("Password cannot be registered in full-width")
    end

    it 'family_name_kanaが空では登録できない' do
      @user.family_name_kana = ''  
      @user.valid?
      expect(user.errors.full_messages).to include "family_name_kana can't be blank"
    end

    it 'first_name_kanaが空では登録できない' do  
      @user.first_name_kana = ''  
      @user.valid?
      expect(user.errors.full_messages).to include "first_name_kana can't be blank"
    end

    it 'family_name_kanaが半角文字だと登録できない' do
      @user.family_name_kana = 'ああ'  
      @user.valid?
      expect(user.errors.full_messages).to include "Cannot register if family_name_kana is half-width characters"
    end

    it 'first_name_kanaが半角文字だと登録できない' do  
      @user.first_name_kana = 'いい'  
      @user.valid?
      expect(user.errors.full_messages).to include "Cannot register if first_name_kana is half-width characters"
    end

    it 'family_name_kanaがカタカナ以外の全角文字だと登録できない' do
      @user.family_name_kana = 'ああ'  
      @user.valid?
      expect(user.errors.full_messages).to include "Cannot register if family_name_kana is a double-byte character other than katakana"
    end

    it 'first_name_kanaがカタカナ以外の全角文字だと登録できない' do  
      @user.first_name_kana = 'いい'  
      @user.valid?
      expect(user.errors.full_messages).to include "Cannot register if first_name_kana is a double-byte character other than katakana"
    end

    it 'birth_dateが空では登録できない' do
      @user.birth_date = ''  
      @user.valid?
      expect(user.errors.full_messages).to include "birth_date can't be blank"
    end
  end
  


end