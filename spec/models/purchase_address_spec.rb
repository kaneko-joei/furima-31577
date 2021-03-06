require 'rails_helper'

RSpec.describe PurchaseAddress, type: :model do
  before do
    @item = FactoryBot.create(:item)
    @user = FactoryBot.create(:user)
    @address = FactoryBot.build(:purchase_address, item_id: @item.id, user_id: @user.id)
    sleep(1)
  end

 context '購入できる場合' do
   it "postal_code, prefecture_id, city, addresses, phone_number, user_id, item_id,がある場合は保存できること" do
     expect(@address).to be_valid
   end
 

   it "building_nameが無くても登録できる" do
      @address.building_name = ''
      expect(@address).to be_valid
   end
  end

 

 context '購入できない場合' do
   it "postal_codeがない場合は保存できないこと" do
     @address.postal_code = ''
     @address.valid?
     expect(@address.errors.full_messages).to include("Postal code can't be blank")
   end

   it "postal_codeにハイフンがない場合は保存できないこと" do
      @address.postal_code = '1112222'
      @address.valid?
      expect(@address.errors.full_messages).to include("Postal code Include hyphen(-)")
   end

   it "prefecture_idがない場合は保存できないこと" do
     @address.prefecture_id = 1
     @address.valid?
     expect(@address.errors.full_messages).to include("Prefecture can't be blank")
   end

   it "cityがない場合は保存できないこと" do
     @address.city = ''
     @address.valid?
     expect(@address.errors.full_messages).to include("City can't be blank")
   end

   it "Addressesがない場合は保存できないこと" do
     @address.addresses = ''
     @address.valid?
     expect(@address.errors.full_messages).to include("Addresses can't be blank")
   end

   it "phone_numberがない場合は保存できないこと" do
     @address.phone_number = ''
     @address.valid?
     expect(@address.errors.full_messages).to include("Phone number can't be blank")
   end

    it "12桁以上では登録できないこと" do
      @address.phone_number = '1112223334445'
      @address.valid?
      expect(@address.errors.full_messages).to include("Phone number is invalid.")
    end

    it "英数混合では登録できないこと" do
      @address.phone_number = 'aaaaaaa111111'
      @address.valid?
      expect(@address.errors.full_messages).to include("Phone number is invalid.")
    end 
      
   it "user_idがない場合は保存できないこと" do
     @address.user_id = ''
     @address.valid?
     expect(@address.errors.full_messages).to include("User can't be blank")
   end

   it "item_idがない場合は保存できないこと" do
     @address.item_id = ''
     @address.valid?
     expect(@address.errors.full_messages).to include("Item can't be blank")
   end

   it "tokenが空では登録できない。" do
     @address.token = ''
     @address.valid?
     expect(@address.errors.full_messages).to include("Token can't be blank")
   end
 end
end


