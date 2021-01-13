FactoryBot.define do
  factory :item_order do
    postal_code        { '171-0022' }
    shipping_area_id   { 14 }
    city               { '豊島区' }
    address            { '南池袋 1-28' }
    phone_number       { '08012345678' }
    building           { '池袋駅' }
  end
end
