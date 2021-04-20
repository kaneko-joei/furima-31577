class User < ApplicationRecord
  
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

         has_many :items

         with_options presence: true do
          validates :nickname
          validates :password,format: { with:/\A(?=.*?[a-z])(?=.*?\d)[a-z\d]+\z/i } 
          validates :birth_date
         
           with_options format: { with:/\A[ぁ-んァ-ン一-龠々]+\z/ } do
              validates :family_name
              validates :first_name
           end
     
           with_options format: { with: /\A[ァ-ヶー－]+\z/ } do
              validates :family_name_kana
              validates :first_name_kana
           end
         end      
     
         
end