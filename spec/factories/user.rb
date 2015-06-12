FactoryGirl.define do 
  factory :user do
    name {Faker::Name.name}
    last_name {Faker::Name.last_name}
    email {Faker::Internet.email}
    password {Faker::Internet.password(8, 20)}
    confirmed_at Date.today
    factory :user_with_all_associations do
	    after(:create) do |user|
	      3.times do 
	      	create(:account, user: user)
	      	create(:category_with_subcategories, user: user)
	      end
	    end
	  end
  end
end
