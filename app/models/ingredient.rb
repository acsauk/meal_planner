class Ingredient < ActiveRecord::Base
  has_many :quantifiables
  has_many :recipes, through: :quantifiables
end
