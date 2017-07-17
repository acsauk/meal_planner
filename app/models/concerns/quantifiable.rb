module Quantifiable
  extend ActiveSupport::Concern

  included do
    has_many :quantities, as: :quantifiable, dependent: :destroy
  end

  def amount_unit
    Unitwise(quantities.first.amount, quantities.first.unit)
  end
end
