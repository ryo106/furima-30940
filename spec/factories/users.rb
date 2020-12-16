FactoryBot.define do
  factory :user do
    nickname              { Faker::Name.initials }
    email                 { Faker::Internet.free_email }
    password              { 'a1' + Faker::Internet.password(min_length: 6) }
    password_confirmation { password }

    birthday              { Faker::Date.backward }
    first_name            { 'ぜんかく' }
    last_name             { 'ぜんかく' }
    first_name_kana       { 'カタカナ' }
    last_name_kana        { 'カタカナ' }
  end
end
