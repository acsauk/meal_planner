FactoryGirl.define do
  factory :recipe do
    association :user
    title 'Chicken Cutlets'
    instructions 'Description text that describes recipe steps goes here'

    trait :with_ingredient do
      after(:create) do |recipe|
        recipe.ingredients << FactoryGirl.build(:ingredient)
      end
    end

    trait :with_ingredients do
      after(:create) do |recipe|
        recipe.ingredients << FactoryGirl.build(:ingredient)
        recipe.ingredients << FactoryGirl.build(:ingredient)
      end
    end

    factory :recipe_with_ingredient, traits: [:with_ingredient]
    factory :recipe_with_ingredients, traits: [:with_ingredients]
  end
end
