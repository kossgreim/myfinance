FactoryGirl.define do 
  factory :category do 
    name { Faker::Commerce.product_name }
    association :user, factory: :user
  end
end