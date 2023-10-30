FactoryBot.define do
      factory :order_ship do
        token {"tok_abcdefghijk00000000000000000"}
        post_code {'123-1234'}
        prefecture_id {Faker::Number.within(range: 2..48)}
        city {Faker::Address.city}
        block {'1-1'}
        building {'愛知ハイツ'}
        phone_number {Faker::Number.leading_zero_number(digits: rand(10..11))}
    
      end
    end
