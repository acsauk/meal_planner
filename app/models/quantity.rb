class Quantity < ActiveRecord::Base
  belongs_to :ingredient
  belongs_to :recipe
  belongs_to :quantifiable, polymorphic: true

  accepts_nested_attributes_for :ingredient,
                                reject_if: :all_blank

  def amount_unit
    Unitwise(amount, unit)
  end
end
