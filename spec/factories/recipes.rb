FactoryGirl.define do
  factory :recipe do
    title 'Chicken Cutlets'
    instructions 'Description text that describes recipe steps goes here'

    after(:create) do |recipe|
      recipe.ingredients << FactoryGirl.build(:ingredient)
    end
  end
end
