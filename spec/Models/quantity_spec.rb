describe Quantity, type: :model do
  it { is_expected.to belong_to(:ingredient) }
  it { is_expected.to belong_to(:recipe) }

  it 'stores amount as Unitwise object' do
    quantity = FactoryGirl.build(:quantity)
    expect(quantity.amount).to be_a Unitwise
  end
end
