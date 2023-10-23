FactoryBot.define do
  factory :item do
    name_item {Faker::Name.name}
    details_item {'test'}
    category_item_id {Faker::Number.within(range: 2..11)}
    status_item_id {Faker::Number.within(range: 2..7)}
    shipping_fee_id {'2'}
    prefecture_id {Faker::Number.within(range: 2..48)}
    lead_time_id {Faker::Number.within(range: 2..4)}
    price {Faker::Number.within(range: 300..9999999)}
    association :user

    after(:build) do |item|
      item.image.attach(io: File.open('public/images/test_image.png'),filename: 'test_image.png')
    end
  end
end
