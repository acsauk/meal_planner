feature 'tags' do
  context 'recipe added' do
    before(:each) do
      sign_up
      add_recipe
    end

    it 'can add tag' do
      click_link 'My Recipes'
      click_link 'Omelette'
      expect(page).to have_field('TagName')
      fill_in 'name', with: 'Healthy'
      click_button 'Add Tag'
      expect(page).to have_content('Tag Successfully added to recipe')
    end
  end
end
