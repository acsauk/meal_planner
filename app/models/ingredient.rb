class Ingredient < ActiveRecord::Base
  include Quantifiable

  has_many :recipes, through: :quantities
end
