class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions

  belongs_to :prefecture
  belongs_to :category
  belongs_to :shipping_cost
  belongs_to :shipping_days
  belongs_to :status

  belongs_to :user
  has_one_attached :image


end
