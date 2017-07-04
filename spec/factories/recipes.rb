FactoryGirl.define do
  factory :recipe do
    association :user
    title 'Chicken Cutlets'
    instructions 'Description text that describes recipe steps goes here'

    transient do
      ingredients_count 2
      amount 1
      unit 'grams'
      ingredient_name nil
    end

    factory :recipe_with_ingredients do
      after(:create) do |recipe, evaluator|
        (0...evaluator.ingredients_count).each do
          case evaluator.ingredient_name
          when nil
            recipe.quantities << FactoryGirl.build(:quantity, ingredient: FactoryGirl.build(:ingredient))
          else
            recipe.quantities << FactoryGirl.build(:quantity, ingredient: FactoryGirl.build(:ingredient, name: evaluator.ingredient_name))
          end
        end
      end
    end
  end
end
