FactoryBot.define do
  factory :item do
    title                             { 'ぜんかく' }
    text                              { 'ぜんかく' }
    category_id                       { 2 }
    product_status_id                 { 2 }
    shipping_fee_burden_id            { 2 }
    prefecture_id                    { 2 }
    delivery_day_id                  { 2 }
    price { 300 }

    association :user

    after(:build) do |item|
      item.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
    end
  end
end
