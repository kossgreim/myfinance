FactoryGirl.define do
  factory :category do
    name { Faker::Commerce.product_name }
    association :user, factory: :user

    factory :category_with_subcategories do
      after(:create) do |category|
        3.times do
          create(:subcategory, category: category)
        end
      end
    end
  end
end
