FactoryGirl.define do
  factory :user do
    sequence :email do |n|
      "test#{n}@gmail.com"
    end
    password 'password123'
  end
end
