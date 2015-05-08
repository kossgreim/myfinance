FactoryGirl.define do 
  factory :user do
    name Faker::Name.name
    last_name Faker::Name.last_name
    email Faker::Internet.email
    password Faker::Internet.password(8, 20)
    confirmed_at Date.today
  end
end
