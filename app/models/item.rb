class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions



  belongs_to :prefecture
  belongs_to :category
  belongs_to :shipping_cost
  belongs_to :shipping_day
  belongs_to :status

  belongs_to :user
  has_one_attached :image
  has_one :purchase_management


  with_options presence: true do
    validates :image
    validates :name
    validates :description
    validates :category_id
    validates :status_id
    validates :shipping_cost_id
    validates :prefecture_id
    validates :shipping_day_id
    validates :price, numericality: {only_integer: true, greater_than_or_equal_to: 300, less_than_or_equal_to: 9999999} 
 end

  with_options numericality: { other_than: 1 } do
     validates :category_id
     validates :status_id
     validates :shipping_cost_id
     validates :shipping_day_id
     validates :prefecture_id
  end




end
