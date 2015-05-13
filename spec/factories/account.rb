FactoryGirl.define do 
  factory :account do
    name {Faker::Commerce.product_name}
   	balance {Faker::Commerce.price}
    association :user, factory: :user
  end
end
