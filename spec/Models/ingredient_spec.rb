describe Ingredient, type: :model do
  it { is_expected.to have_many(:recipes).through(:quantities) }
  it { is_expected.to have_many(:quantities) }
end
