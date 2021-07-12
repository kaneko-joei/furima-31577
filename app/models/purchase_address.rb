class PurchaseAddress 
  include ActiveModel::Model
  attr_accessor :postal_code, :prefecture_id, :city, :addresses, :building_name, :phone_number, :user_id, :item_id, :token

  with_options presence: true do
    validates :postal_code, format: { with: /\A[0-9]{3}-[0-9]{4}\z/, message: "Include hyphen(-)" }
    validates :city 
    validates :addresses
    validates :phone_number
    validates :user_id
    validates :item_id
  end
  validates :prefecture_id, numericality: { other_than: 1, message: "can't be blank" }
  

  def save
    purchase_management = PurchaseManagement.create(user_id: user_id,item_id: item_id)
    Address.create(postal_code: postal_code, prefecture_id: prefecture_id, city: city, addresses: addresses, building_name: building_name, phone_number: phone_number,purchase_management_id: purchase_management.id)
  end
end

