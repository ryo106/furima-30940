FactoryBot.define do
  factory :order_address do
    postal_code                      { '123-4567' }
    prefecture_id                    { 2 }
    municipality                     { '全角' }
    address                          { '青山1-1-1' }
    building_name                    { '建物名'}
    phone_number                     { '09054383161' }
    token                            { 'tok_abcdefghijk00000000000000000' }
  end
end
