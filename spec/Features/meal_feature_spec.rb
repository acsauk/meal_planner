feature 'meals' do
  let!(:saved_recipe) { FactoryGirl.create(:recipe_with_ingredients) }
  let!(:meal) { FactoryGirl.build(:meal) }

  before(:each) do
    sign_up
    saved_recipe
  end

  context 'creating meals' do
    scenario 'a user can create a meal' do
      visit recipes_path
      click_link saved_recipe.title
      click_link 'Add meal'
      select meal.day_slot
      select meal.meal_slot
      select saved_recipe.title
      click_button 'Create Meal'
      expect(page).to have_content meal.day_slot
      expect(page).to have_content meal.meal_slot
      expect(current_path).to eq '/'
    end
  end

  context 'viewing a meal planner' do
    scenario 'a user can view a meal plan' do
      add_recipe(title: 'Hamburgers')
      add_meal(title: 'Hamburgers')
      expect(page).to have_content 'Omelette'
      expect(page).to have_content 'Hamburgers'
      expect(current_path).to eq '/'
    end
  end
end
