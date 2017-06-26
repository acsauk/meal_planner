FactoryGirl.define do
  factory :ingredient do
    sequence :name do |n|
      "ingredient#{n}"
    end

    transient do
      quantities_count 1
    end

    factory :ingredient_with_quantities do
      after(:create) do |ingredient, evaluator|
        properties = { amount: 1, unit: 'gram' }

        (0...evaluator.quantities_count).each do
          ingredient.quantities << FactoryGirl.create(:quantity, properties)
          # ingredient.recipes << FactoryGirl.create(:recipe)
        end
      end
    end
  end
end
