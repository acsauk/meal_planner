feature 'Recipes' do
  before(:each) do
    sign_up
    recipe_with_ingredients = FactoryGirl.build(:recipe_with_ingredients)
  end

  context 'user signed in' do
    scenario 'adding recipes' do
      click_link 'Add recipe'
      fill_in 'Title', with: recipe_with_ingredients.title
      fill_in 'Instructions', with: recipe_with_ingredients.instructions
      fill_in('recipe[ingredients_attributes][0][name]', with: recipe_with_ingredients.ingredients.first.name)
      fill_in('recipe[ingredients_attributes][0][quantity]', with: recipe_with_ingredients.ingredients.first.quantity)
      fill_in('recipe[ingredients_attributes][1][name]', with: recipe_with_ingredients.ingredients.second.name)
      fill_in('recipe[ingredients_attributes][1][quantity]', with: recipe_with_ingredients.ingredients.second.quantity)
      click_button 'Create Recipe'
      expect(page).to have_content "#{recipe_with_ingredients.title} recipe successfully created"
      expect(page).to have_link "#{recipe_with_ingredients.title}"
      expect(current_path).to eq '/recipes'
    end

    scenario 'editing a recipe' do
      visit '/recipes'
      click_link 'Edit recipe'
      fill_in('Title', with: 'Ham Omelette')
      fill_in('recipe[ingredients_attributes][1][name]', with: 'Ham')
      click_button 'Update Recipe'
      expect(page).to have_content 'Ham Omelette'
    end

    scenario 'deleting a recipe' do
      visit '/recipes'
      click_link 'Delete recipe'
      expect(page).not_to have_content('Omelette')
    end

    scenario 'viewing a recipe' do
      click_link 'My Recipes'
      click_link 'Omelette'
      expect(page).to have_content 'Omelette'
      expect(page).to have_content 'Egg'
      expect(page).to have_content '2'
    end
  end
end
