describe Quantity, type: :model do
  it { is_expected.to belong_to(:ingredient) }
  it { is_expected.to belong_to(:recipe) }

  # let(:quantity) { FactoryGirl.build(:quantity) }

  # it 'amount_unit is returned as a Unitwise::Measurement object' do
  #   expect(quantity.amount_unit).to be_a Unitwise::Measurement
  # end
  #
  # it 'amount_unit.value returns amount attribute' do
  #   expect(quantity.amount_unit.value).to eq quantity.amount
  # end
  #
  # it 'amount_unit.unit returns unit attribute' do
  #   expect(quantity.amount_unit.unit.expression).to eq quantity.unit
  # end
end
