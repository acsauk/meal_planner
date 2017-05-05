require 'rails_helper'

RSpec.describe MealCell, type: :cell do

  context 'cell rendering' do
    context 'rendering show' do
      subject { cell(:meal, Meal.new).call(:show) }

      it { is_expected.to have_selector('a', text: 'Meal#show') }
    end
  end

end
