FactoryGirl.define do
  factory :ingredient do
    sequence :name do |n|
      "ingredient#{n}"
    end

    factory :ingredient_with_quantities do
      transient do
        quantities_count 1
      end

      after(:create) do |ingredient, evaluator|
        create_list(:quantity, evaluator.quantities_count, quantity: ingredient)
      end
    end
  end
end
