FactoryBot.define do
  factory :purchase_address do
    association :user
    association :item
    token            { 'tok_abcdefghijk00000000000000000' }
    price            { 2000 }
    postal_code      { '111-1234' }
    prefecture_id    { '3' }
    municipality     { '大阪市' }
    address          { '港区磯路2長目' }
    building_name    { 'ユースハイツ' }
    phone_number     { '0120451893' }
  end
end
