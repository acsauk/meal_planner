FactoryGirl.define do
  factory :ingredient do
    sequence :name do  |n|
      "ingredient#{n}"
    end
    quantity '100g'
  end
end
