FactoryBot.define do
  factory :ship do
    post_code {'123-1234'}
    prefecture_id { 1 }
    city {'愛知'}
    block {'1-1'}
    building {'愛知ハイツ'}
    phone_number {'00012341234'}
    order_id {'1'}
  end
end
