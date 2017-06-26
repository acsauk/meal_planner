FactoryGirl.define do
  factory :recipe do
    association :user
    title 'Chicken Cutlets'
    instructions 'Description text that describes recipe steps goes here'

    transient do
      ingredients_count 2
    end

    factory :recipe_with_ingredients do
      after(:create) do |recipe, evaluator|
        (0...evaluator.ingredients_count).each do
          recipe.ingredients << FactoryGirl.create(:ingredient_with_quantities)
        end
      end
    end
  end
end
