FactoryBot.define do
  factory :recipe do
    name { 'Recipe' }
    preparation_time { 2 }
    cooking_time { 4 }
    description { 'Description' }
    public { false }

    trait :user do
      user
    end
  end
end
