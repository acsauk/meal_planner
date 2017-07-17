require 'concerns/quantifiable_spec.rb'

describe Ingredient, type: :model do
  it_behaves_like 'quantifiable'
  it { is_expected.to have_many(:recipes).through(:quantities) }
end
