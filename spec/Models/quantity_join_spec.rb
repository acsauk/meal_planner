require 'rails_helper'

describe QuantityJoin, type: :model do
  # subject { FactoryGirl.build(:quantity_join) }

  context 'validations' do
    it {
      is_expected.to have_db_column(:quantity_id).of_type(:integer)
        .with_options(null: false)
    }
    it {
      is_expected.to have_db_column(:quantifiable_id).of_type(:integer)
        .with_options(null: false)
    }
    it {
      is_expected.to have_db_column(:quantifiable_type).of_type(:string)
        .with_options(null: false)
    }
  end

  context 'associations' do
    it { is_expected.to belong_to(:quantifiable) }
    it { is_expected.to belong_to(:quantity) }
  end
end
