FactoryGirl.define do
  factory :quantity do
    sequence :amount
    unit 'grams'
    association :recipe
    association :ingredient
  end
end
