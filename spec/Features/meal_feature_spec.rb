feature 'meals' do
  let!(:saved_recipe) { FactoryGirl.create(:recipe) }
  let!(:meal) { FactoryGirl.build(:meal) }

  context 'creating meals' do
    scenario 'a user can create a meal' do
      visit '/'
      click_link 'Sign in'
      fill_in 'Email', with: saved_recipe.user.email
      fill_in 'Password', with: saved_recipe.user.password
      click_button 'Log in'
      visit recipes_path
      click_link saved_recipe.title.to_s
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
      meal_with_recipe_and_user = FactoryGirl.create(:meal_with_recipe_and_user)
      visit '/'
      click_link 'Sign in'
      fill_in 'Email', with: meal_with_recipe_and_user.user.email
      fill_in 'Password', with: meal_with_recipe_and_user.user.password
      click_button 'Log in'
      binding.pry
      expect(page).to have_content meal_with_recipe_and_user.recipes.first.title
      expect(current_path).to eq '/'
    end
  end
end
