feature 'Recipes' do
  let!(:user) { FactoryGirl.create(:user) }
  let!(:saved_recipe) { FactoryGirl.create(:recipe_with_ingredients, user: user) }

  before(:each) do
    login_as(user, scope: :user)
    # visit new_user_session_path
    # fill_in "user_email", with: user.email
    # fill_in "user_password", with: user.password
    # click_button 'Log in'
  end

  scenario 'adding recipes', js:true do
    visit '/'
    click_link 'Add recipe'
    fill_in 'Title', with: "#{saved_recipe.title} 2"
    fill_in 'Instructions', with: "#{saved_recipe.instructions} 2"
    click_link 'add ingredient'
    find('#recipe-ingredients :nth-child(2) .nested_ingredient').set("#{saved_recipe.ingredients.first.name} 2")
    find('#recipe-ingredients :nth-child(2) .nested_amount').set("#{saved_recipe.quantities.first.amount} 2")
    find('#recipe-ingredients :nth-child(2) .nested_unit').set("#{saved_recipe.quantities.first.unit} 2")
    click_link 'add ingredient'
    find('#recipe-ingredients :nth-child(3) .nested_ingredient').set("#{saved_recipe.ingredients.first.name} 3")
    find('#recipe-ingredients :nth-child(3) .nested_amount').set("#{saved_recipe.quantities.first.amount} 3")
    find('#recipe-ingredients :nth-child(3) .nested_unit').set("#{saved_recipe.quantities.first.unit} 3")
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
