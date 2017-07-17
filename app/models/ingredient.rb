class Ingredient < ActiveRecord::Base
  has_many :quantities, as: :quantifiable
  has_many :recipes, through: :quantities
end
