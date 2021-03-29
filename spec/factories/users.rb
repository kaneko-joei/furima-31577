

FactoryBot.define do
  factory :user do
    nickname              {Faker::Name.initials(number: 2)}
    email                 {Faker::Internet.free_email}
    password              { '1a' + Faker::Internet.password(min_length: 4) }
    password_confirmation {password}
    family_name           {'金子'}
    first_name            {'城栄'}
    family_name_kana      {'カネコ'}
    first_name_kana       {'ジョウエイ'}
    birth_date            {'2021-03-15'}
  end
end
