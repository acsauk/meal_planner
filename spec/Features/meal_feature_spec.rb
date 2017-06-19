feature 'meals' do
  before(:each) do
    sign_up
    
    add_meal
  end

  context 'creating meals' do
    scenario 'a user can create a meal' do
      expect(page).to have_content 'Monday'
      expect(page).to have_content 'Evening'
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
