class User < ApplicationRecord
  
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  with_options presence: true do
         validates :nickname
         validates :email
         validates :password
         validates :family_name, format: { with:/\A[ぁ-んァ-ン一-龥]/ }
         validates :first_name, format: { with: /\A[ぁ-んァ-ヶ一-龥]/ }
         validates :family_name_kana, format: { with: /\A[ァ-ヶー－]+\z/ }
         validates :first_name_kana, format: { with: /\A[ァ-ヶー－]+\z/ }
         validates :birth_date
  end      
end
