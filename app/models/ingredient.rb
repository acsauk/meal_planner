class Ingredient < ActiveRecord::Base
  include Quantifiable

  has_many :quantities, as: :quantifiable
  has_many :recipes, through: :quantities
end
