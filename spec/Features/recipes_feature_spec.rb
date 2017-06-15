feature 'Recipes' do
  before(:each) do
    sign_up
    saved_recipe = FactoryGirl.create(:recipe_with_ingredients)
  end

  context 'user signed in' do
    scenario 'adding recipes' do
      built_recipe = FactoryGirl.build(:recipe_with_ingredients)
      click_link 'Add recipe'
      fill_in 'Title', with: built_recipe.title
      fill_in 'Instructions', with: built_recipe.instructions
      fill_in('recipe[ingredients_attributes][0][name]', with: built_recipe.ingredients.first.name)
      fill_in('recipe[ingredients_attributes][0][quantity]', with: built_recipe.ingredients.first.quantity)
      fill_in('recipe[ingredients_attributes][1][name]', with: built_recipe.ingredients.second.name)
      fill_in('recipe[ingredients_attributes][1][quantity]', with: built_recipe.ingredients.second.quantity)
      click_button 'Create Recipe'
      expect(page).to have_content "#{built_recipe.title} recipe successfully created"
      expect(page).to have_link "#{built_recipe.title}"
      expect(current_path).to eq '/recipes'
    end

    scenario 'editing a recipe' do
      visit '/recipes'
      click_link 'Edit recipe'
      fill_in('Title', with: "#{saved_recipe.title} edit")
      fill_in('recipe[ingredients_attributes][1][name]', with: "#{saved_recipe.ingredients.first.name} edit")
      click_button 'Update Recipe'
      expect(page).to have_content "#{saved_recipe.title} edit"
      click_link saved_recipe.title.to_s
      expect(page).to have_content "#{saved_recipe.ingredients.first.name} edit"
    end

    scenario 'deleting a recipe' do
      visit '/recipes'
      click_link 'Delete recipe'
      expect(page).not_to have_content(saved_recipe.title.to_s)
    end

    scenario 'viewing a recipe' do
      visit '/recipes'
      click_link saved_recipe.title.to_s
      expect(page).to have_content "#{built_recipe.ingredients.first.quantity} #{built_recipe.ingredients.first.name}"
      expect(page).to have_content "#{built_recipe.ingredients.second.quantity} #{built_recipe.ingredients.second.name}"
    end
  end
end
