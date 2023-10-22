FactoryBot.define do
  factory :item do
    user {Faker::Name.name}
    name_item {Faker::Name.name}
    details_item {'test'}
    category_item_id {Faker::Number.within(range: 2..11)}
    status_item_id {Faker::Number.within(range: 2..7)}
    shipping_fee_id {'2'}
    prefecture_id {Faker::Number.within(range: 2..48)}
    lead_time_id {Faker::Number.within(range: 2..4)}
    price {'00000'}
  end
end
