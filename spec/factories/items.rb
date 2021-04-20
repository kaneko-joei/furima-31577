FactoryBot.define do
  factory :item do
    name               {Faker::Name.name}
    description        {Faker::Lorem.sentence(1000)}
    category_id           {2}
    status_id            {2}
    shipping_cost_id     {2}
    prefecture_id        {2}
    shipping_day_id      {2}
    price             {Faker::Number.between(from: 300, to: 9_999_999)}

    association :user
    
    after(:build) do |item|
      item.image.attach(io: File.open('public/images/IMG_1466.jpeg'), filename: 'IMG_1466.jpeg')
    end
  end
end
