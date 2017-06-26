FactoryGirl.define do
  factory :ingredient do
    sequence :name do |n|
      "ingredient#{n}"
    end

    transient do
      recipes_count 1
    end

    factory :ingredient_with_recipes do
      after(:create) do |ingredient, evaluator|
        (0...evaluator.recipes_count).each do
          ingredient.quantities << FactoryGirl.create(:quantity)
          ingredient.recipes << FactoryGirl.create(:recipe)
        end
      end
    end
  end
end
