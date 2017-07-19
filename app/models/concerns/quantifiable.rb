module Quantifiable
  extend ActiveSupport::Concern

  included do
    has_many :quantity_joins, as: :quantifiable, dependent: :destroy
    has_one :quantity, through: :quantity_joins
  end

  def amount_unit
    Unitwise(quantities.first.amount, quantities.first.unit)
  end
end
