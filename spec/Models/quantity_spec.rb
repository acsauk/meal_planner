describe Quantity, type: :model do
  it { is_expected.to belong_to(:ingredient) }
  it { is_expected.to belong_to(:recipe) }

  it 'amount attribute is returned as a Unitwise::Measurement object' do
    quantity = FactoryGirl.build(:quantity)
    expect(quantity.amount_unit).to be_a Unitwise::Measurement
  end

  it 'amount attribute returns Unitwise::Measurement with initial amount' do
    quantity = FactoryGirl.build(:quantity)
    expect(quantity.amount_unit.value).to eq quantity.amount
  end
end
