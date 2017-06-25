FactoryGirl.define do
  factory :quantity do
    association :recipe
    association :ingredient
    sequence :amount do |n|
      n.to_s
    end
    unit 'grams'
  end
end
