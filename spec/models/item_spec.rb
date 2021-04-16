require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
  end

 context '出品できる場合' do
   it "item,image,name,description,category,status,shipping_cost,shipping_day,prefecture,price,がある場合は保存できること" do
     expect(@item).to be_valid
   end
 end
 

 context '出品できない場合' do
   it "imageがない場合は保存できないこと" do
     @item.image = nil
     @item.valid?
     expect(@item.errors.full_messages).to include("Image can't be blank")
   end

   it "nameがない場合は保存できないこと" do
     @item.name = ''
     @item.valid?
     expect(@item.errors.full_messages).to include("Name can't be blank")
   end

    it "descriptionがない場合は保存できないこと" do
      @item.description = ''
      @item.valid?
      expect(@item.errors.full_messages).to include("Description can't be blank")
    end

   it "categoryがない場合は保存できないこと" do
     @item.category_id = ''
     @item.valid?
     expect(@item.errors.full_messages).to include("Category can't be blank")
   end

   it "statusがない場合は保存できないこと" do
     @item.status_id = ''
     @item.valid?
     expect(@item.errors.full_messages).to include("Status can't be blank")
   end

   it "shipping_costがない場合は保存できないこと" do
     @item.shipping_cost_id = ''
     @item.valid?
     expect(@item.errors.full_messages).to include("Shipping cost can't be blank")
   end

   it "prefectureがない場合は保存できないこと" do
     @item.prefecture_id = ''
     @item.valid?
     expect(@item.errors.full_messages).to include("Prefecture can't be blank")
   end

   it "shipping_dayがない場合は保存できないこと" do
     @item.shipping_day_id = ''
     @item.valid?
     expect(@item.errors.full_messages).to include("Shipping day can't be blank")
   end
        

   it "priceがない場合は保存できないこと" do
     @item.price = ''
     @item.valid?
     expect(@item.errors.full_messages).to include("Price can't be blank")
   end

   it "priceが300以下の場合は保存できないこと" do
     @item.price = '299'
     @item.valid?
     expect(@item.errors.full_messages).to include("Price must be greater than or equal to 300")
   end

   it "priceが9,999,999以上の場合は保存できないこと" do
     @item.price = '100000000'
     @item.valid?
     expect(@item.errors.full_messages).to include("Price must be less than or equal to 9999999")
   end
 end
        
 

end


