class QuantityJoin < ActiveRecord::Base
  belongs_to :quantifiable, polymorphic: true
  belongs_to :quantity
end
