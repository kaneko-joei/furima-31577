require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end

  describe "ユーザーテスト" do
    it 'nicknameとemail、passwordとpassword_confirmation、family_namefirst_name、family_name_kana、first_name_kana、birth_dateが存在すれば登録できる' do
      expect(@user).to be_valid
    end
  
    it 'nicknameが空では登録できない' do
      user = FactoryBot.build(:user)  
      user.nickname = ''  
      user.valid?
      expect(user.errors.full_messages).to include "Nickname can't be blank"
    end
    it 'emailが空では登録できない' do
      user = FactoryBot.build(:user)  
      user.email = ''  
      user.valid?
      expect(user.errors.full_messages).to include "Email can't be blank"rails
    end
    it 'password:半角英数混合(半角英語のみ)' do
      @user.password = 'aaaaaaa'
      @user.valid?
      expect(@user.errors.full_messages).to include('Password Include both letters and numbers')
    end
    it 'family_nameが空では登録できない' do
      user = FactoryBot.build(:user)  
      user.family_name = ''  
      user.valid?
      expect(user.errors.full_messages).to include "family_name can't be blank"
    end
    it 'first_nameが空では登録できない' do
      user = FactoryBot.build(:user)  
      user.first_name = ''  
      user.valid?
      expect(user.errors.full_messages).to include "first_name can't be blank"
    end
    it 'family_name_kanaが空では登録できない' do
      user = FactoryBot.build(:user)  
      user.family_name_kana = ''  
      user.valid?
      expect(user.errors.full_messages).to include "family_name_kana can't be blank"
    end
    it 'first_name_kanaが空では登録できない' do
      user = FactoryBot.build(:user)  
      user.first_name_kana = ''  
      user.valid?
      expect(user.errors.full_messages).to include "first_name_kana can't be blank"
    end
    it 'birth_dateが空では登録できない' do
      user = FactoryBot.build(:user)  
      user.birth_date = ''  
      user.valid?
      expect(user.errors.full_messages).to include "birth_date can't be blank"
    end
  end


end