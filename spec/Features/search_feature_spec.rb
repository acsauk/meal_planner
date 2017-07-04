feature 'search' do
  let!(:user) { FactoryGirl.create(:user) }
  let!(:saved_recipe) do
    FactoryGirl.create(:recipe_with_ingredients, user: user)
  end
  let!(:saved_recipe2) do
    FactoryGirl.create(:recipe_with_ingredients, user: user, title: 'Pasta', ingredient_name: 'spaghetti')
  end

  before(:each) do
    login_as(user, scope: :user)
    visit '/recipes'
  end

  scenario 'by recipe titles' do
    fill_in 'q_title_or_ingredients_name_cont', with: saved_recipe2.title
    click_button 'Search'
    expect(page).to have_content(saved_recipe2.title)
    expect(page).not_to have_content(saved_recipe.title)
  end

  scenario 'by ingredients' do
    fill_in 'q_title_or_ingredients_name_cont', with: saved_recipe2.ingredients.first.name
    click_button 'Search'
    expect(page).to have_content(saved_recipe2.title)
    expect(page).not_to have_content(saved_recipe.title)
  end
end
