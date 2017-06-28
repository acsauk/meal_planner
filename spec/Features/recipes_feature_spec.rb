feature 'Recipes' do
  let!(:saved_recipe) { FactoryGirl.create(:recipe_with_ingredients) }

  before(:each) do
    visit '/'
    click_link 'Sign in'
    fill_in 'Email', with: saved_recipe.user.email
    fill_in 'Password', with: saved_recipe.user.password
    click_button 'Log in'
  end

  scenario 'adding recipes', js:true do
    visit '/'
    click_link 'Add recipe'
    save_and_open_page
    fill_in 'Title', with: "#{saved_recipe.title} 2"
    fill_in 'Instructions', with: "#{saved_recipe.instructions} 2"
    click_link 'add ingredient'
    find('#recipe-ingredients .nested-fields:last-child input#name').set("#{saved_recipe.ingredients.first.name} 2")
    # fill_in 'recipe[ingredients_attributes][0][name]', with: "#{saved_recipe.ingredients.first.name} 2"
    # fill_in 'recipe[ingredients_attributes][0][quantity]', with: "#{saved_recipe.ingredients.first.quantity} 2"
    # select 'grams', from: 'recipe[ingredients_attributes][0][unit]'
    # fill_in 'recipe[ingredients_attributes][1][name]', with: "#{saved_recipe.ingredients.second.name} 2"
    # fill_in 'recipe[ingredients_attributes][1][quantity]', with: "#{saved_recipe.ingredients.second.quantity} 2"
    # select 'grams', from: 'recipe[ingredients_attributes][1][unit]'
    click_button 'Create Recipe'
    expect(page).to have_content "#{saved_recipe.title} 2 recipe successfully created"
    expect(page).to have_link "#{saved_recipe.title} 2"
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
    expect(page).to have_content "#{saved_recipe.ingredients.first.quantity} #{saved_recipe.ingredients.first.name}"
    expect(page).to have_content "#{saved_recipe.ingredients.second.quantity} #{saved_recipe.ingredients.second.name}"
  end
end
