FactoryGirl.define do
  factory :quantity do
    association :recipe
    association :ingredient
    sequence :amount
    unit 'grams'
  end
end
