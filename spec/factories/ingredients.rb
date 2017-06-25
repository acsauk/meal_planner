FactoryGirl.define do
  factory :ingredient do
    association :quantity
    sequence :name do |n|
      "ingredient#{n}"
    end
  end
end
