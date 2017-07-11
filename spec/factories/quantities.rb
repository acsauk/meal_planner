FactoryGirl.define do
  factory :quantity do
    sequence :amount
    unit 'gram'
    association :recipe
    association :ingredient
  end

  factory :quantity_ingredient_association do
    sequence :amount
    unit 'gram'
    association :ingredient
  end
end
