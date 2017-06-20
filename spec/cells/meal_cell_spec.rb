describe MealCell, type: :cell do
  let(:saved_meal) { FactoryGirl.create(:meal_with_recipe_and_user) }

  subject do
    cell(:meal, saved_meal).call(:show)
  end
  
  it { expect(subject).to have_content 'Meal#show' }
end
