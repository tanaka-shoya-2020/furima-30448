FactoryBot.define do
  factory :item do
    association :user

    name                    { Faker::Name.name }
    description             { Faker::Lorem.sentences }
    category_id             { Faker::Number.within(range: 2..10) }
    status_id               { Faker::Number.within(range: 2..7) }
    delivery_burden_id      { Faker::Number.within(range: 2..3) }
    shipping_area_id        { Faker::Number.within(range: 2..48) }
    days_ship_id            { Faker::Number.within(range: 2..4) }
    price                   { Faker::Number.between(from: 300, to: 9_999_999) }
  end
end
