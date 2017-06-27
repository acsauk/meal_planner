FactoryGirl.define do
  factory :recipe do
    association :user
    title 'Chicken Cutlets'
    instructions 'Description text that describes recipe steps goes here'

    transient do
      ingredients_count 2
      amount 1
      unit 'grams'
    end

    factory :recipe_with_ingredients do
      after(:create) do |recipe, evaluator|
        (0...evaluator.ingredients_count).each do
          recipe.quantities << FactoryGirl.create(:quantity, ingredient: FactoryGirl.create(:ingredient))
        end
      end
    end
  end
end
