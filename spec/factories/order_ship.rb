FactoryBot.define do
  factory :order_ship do
    user_id {Faker::Number.number}
    item_id {Faker::Number.number}
    token {"tok_abcdefghijk00000000000000000"}

    post_code {'123-1234'}
    prefecture_id {Faker::Number.within(range: 2..48)}
    city {'愛知'}
    block {'1-1'}
    building {'愛知ハイツ'}
    phone_number {'00012341234'}
    order_id {'1'}


  end
end