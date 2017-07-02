class Recipe < ActiveRecord::Base
  belongs_to :user
  belongs_to :meal

  has_many :quantities, inverse_of: :recipe, dependent: :destroy
  has_many :ingredients, through: :quantities, dependent: :destroy

  has_many :meal_recipes, dependent: :destroy
  has_many :meals, through: :meal_recipes, dependent: :destroy

  has_many :tags, through: :tag_recipes, dependent: :destroy
  has_many :tag_recipes, dependent: :destroy

  accepts_nested_attributes_for :quantities,
                                allow_destroy: true,
                                reject_if: :all_blank

  accepts_nested_attributes_for :ingredients

  accepts_nested_attributes_for :meal_recipes, allow_destroy: true
end
