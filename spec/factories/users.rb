FactoryBot.define do
  factory :user do
    nickname              { 'test' }
    email                 { Faker::Internet.free_email }
    password              { 'a00000' }
    password_confirmation { password }
    last_name             { '山田' }
    first_name                 { '太郎' }
    last_name_kana             { 'ヤマダ' }
    first_name_kana { 'タロウ' }
    birth_date { '2000-01-01' }
  end
end
