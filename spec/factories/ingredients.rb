FactoryGirl.define do
  factory :ingredient do
    sequence :name do |n|
      "ingredient#{n}"
    end

    transient do
      recipies_count 1
    end

    factory :ingredient_with_recipes do
      after(:create) do |ingredient, evaluator|
        (0...evaluator.recipies_count).each do
          ingredient.recipes << FactoryGirl.create(:recipe)
        end
      end
    end
  end
end
