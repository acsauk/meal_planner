describe Quantity, type: :model do
  it { is_expected.to belong_to(:ingredient) }
  it { is_expected.to belong_to(:recipe) }
end
