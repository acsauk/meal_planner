class Recipe < ActiveRecord::Base
  belongs_to :user
  belongs_to :meal

  has_many :recipe_ingredients, dependent: :destroy
  has_many :ingredients, through: :recipe_ingredients, dependent: :destroy

  has_many :meal_recipes, dependent: :destroy
  has_many :meals, through: :meal_recipes, dependent: :destroy

  has_many :tag_recipes
  has_many :tags, through: :tag_recipes

  accepts_nested_attributes_for :ingredients,
                                allow_destroy: true,
                                reject_if: :all_blank

  accepts_nested_attributes_for :meal_recipes, allow_destroy: true

  def self.search(search)
    joins(:ingredients)
      .where('title ILIKE ? OR ingredients.name ILIKE ? ',
             "%#{search}%", "%#{search}%")
  end
end
