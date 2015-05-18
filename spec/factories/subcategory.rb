FactoryGirl.define do
  factory :subcategory do
    name { Faker::Commerce.product_name }
    association :category, factory: :category
  end
end
