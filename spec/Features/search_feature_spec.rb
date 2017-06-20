feature 'search' do
  let!(:saved_recipe) { FactoryGirl.create(:recipe_with_ingredients) }

  before(:each) do
    visit '/'
    click_link 'Sign in'
    fill_in 'Email', with: saved_recipe.user.email
    fill_in 'Password', with: saved_recipe.user.password
    click_button 'Log in'
  end

  scenario 'by recipe titles' do
    saved_recipe2 = FactoryGirl.create(:recipe_with_ingredients, title: 'Pasta')
    fill_in 'q_title_or_ingredients_name_cont', with: saved_recipe.title
    click_button 'Search'
    expect(page).to have_content(saved_recipe.title)
    expect(page).not_to have_content(saved_recipe2.title)
  end

  scenario 'by ingredients' do
    saved_recipe2 = FactoryGirl.create(:recipe_with_ingredients, title: 'Pasta')
    fill_in 'q_title_or_ingredients_name_cont', with: saved_recipe.ingredients.first.name
    click_button 'Search'
    expect(page).to have_content(saved_recipe.title)
    expect(page).not_to have_content(saved_recipe2.title)
  end
end
