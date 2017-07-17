require 'rails_helper'

shared_examples_for 'quantifiable' do
  context 'associations' do
    it { is_expected.to have_many(:quantifiables) }
  end

  let(:model) { described_class } # the class that includes the concerns

  it "has a an amount and unit" do
    quantifiable = FactoryGirl.create(model.to_s.underscore.to_sym, amount: 1, unit: "gram")
    expect(quantifiable.amount_unit).to eq("1 gram")
  end

  it 'amount_unit is returned as a Unitwise::Measurement object' do
    expect(model.amount_unit).to be_a Unitwise::Measurement
  end

  it 'amount_unit.value returns amount attribute' do
    expect(model.amount_unit.value).to eq model.amount
  end

  it 'amount_unit.unit returns unit attribute' do
    expect(model.amount_unit.unit.expression).to eq model.unit
  end
end