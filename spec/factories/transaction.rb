FactoryGirl.define do
  factory :transaction do
    comment { Faker::Lorem.sentence }
    amount { Faker::Commerce.price }
   	type { [true, false].sample }
    association :category, factory: :category
    association :subcategory, factory: :subcategory
    association :account, factory: :account
    association :user, factory: :user
  end
end
