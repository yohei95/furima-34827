FactoryBot.define do
  factory :purchase_shipping do
    postal_code              { '123-4567' }
    prefecture_id            { 2 }
    city              { '横浜市緑区' }
    address           { '青山1-1-1' }
    building          {'柳ビル103'}
    phone_number             { '09012345678' }
    token                    { 'aaaaaaaaaaaa' }
  end
end
