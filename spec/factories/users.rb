

FactoryBot.define do
  factory :user do
    nickname              {'test'}
    email                 {'test@example'}
    password              {'a00000'}
    family_name           { 'test'    }
    first_name            {  'test'   }
    family_name_kana      {  'test'   }
    first_name_kana       {   'test'  }
    birth_date            {'2021-03-15'}
  end
end
