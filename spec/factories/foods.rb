FactoryBot.define do
  factory :food do
    name { 'Foodname' }
    measurement_unit { 'units' }
    price { '5.99' }

    trait :user do
      user
    end
  end
end
