FactoryGirl.define do
  factory :meal do
    day_slot 'Monday'
    meal_slot 'Morning'

    trait :with_user do
      association :user
    end

    trait :with_recipe do
      after(:create) do |meal|
        meal.recipes << FactoryGirl.build(:recipe)
      end
    end

    trait :with_recipe_and_user do
      after(:create) do |meal|
        recipe = FactoryGirl.build(:recipe)
        meal.recipes << recipe
        meal.user = recipe.user
        meal.save
      end
    end

    factory :meal_with_recipe, traits: [:with_recipe]
    factory :meal_with_user, traits: [:with_user]
    factory :meal_with_recipe_and_user, traits: [:with_recipe_and_user]
  end
end
