FactoryGirl.define do
  factory :quantity do
    sequence :amount
    unit 'gram'
    association :recipe
    association :ingredient
  end
end
