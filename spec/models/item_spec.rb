require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
end

context '出品できる場合' do
  it "itemとitem_imageがある場合は保存できること" do
    expect(build(:item, item_images: [build(:item_image)])).to be_valid
  end
end

context '出品できない場合' do
  it "item_imageがない場合は保存できないこと" do
    item = build(:product)
    item.valid?
    expect(item.errors[:item_images]).to include("can't be blank")
  end

  it "nameがない場合は保存できないこと" do
    item = build(:item, name: nil, item_images: [build(:item_image)])
    item.valid?
    expect(item.errors[:name]).to include("can't be blank")
  end

  it "descriptionがない場合は保存できないこと" do
    item = build(:item, desription: nil, item_images: [build(:item_image)])
    item.valid?
    expect(item.errors[:desription]).to include("can't be blank")
  end

  it "category_idがない場合は保存できないこと" do
    item = build(:item, category_id: nil, item_images: [build(:item_image)])
    item.valid?
    expect(product.errors[:category_id]).to include()
  end

  it "status_idがない場合は保存できないこと" do
    item = build(:item, status_id: nil, item_images: [build(:item_image)])
    item.valid?
    expect(product.errors[:status_id]).to include()
  end

  it "shipping_cost_idがない場合は保存できないこと" do
    item = build(:item, shipping_cost_id: nil, item_images: [build(:item_image)])
    item.valid?
    expect(product.errors[:shipping_cost_id]).to include()

  end

  it "area_idがない場合は保存できないこと" do
    item = build(:item, infomation: nil, item_images: [build(:item_image)])
    item.valid?
    expect(product.errors[:area_id]).to include()
      end

      it "day_idがない場合は保存できないこと" do
        item = build(:item, infomation: nil, item_images: [build(:item_image)])
        item.valid?
        expect(product.errors[:day_id]).to include()
      end

      it "priceがない場合は保存できないこと" do
        item = build(:item, infomation: nil, item_images: [build(:item_image)])
        item.valid?
        expect(product.errors[:price]).to include()
      end

      it "priceが300以下の場合は保存できないこと" do
        item = build(:item, price: "299", item_images: [build(:item_image)])
        item.valid?
        expect(item.errors[:price]).to include()
      end

      it "priceが9,999,999以上の場合は保存できないこと" do
        item = build(:item, price: "10000000", item_images: [build(:item_image)])
        item.valid?
        expect(item.errors[:price]).to include()
      end
        
      it "user_idがない場合は保存できないこと" do
        item = build(:item, user_id: nil, item_images: [build(:item_image)])
        item.valid?
        
        expect(item.errors[:user_id]).to include()
      end
    end
  end
end

