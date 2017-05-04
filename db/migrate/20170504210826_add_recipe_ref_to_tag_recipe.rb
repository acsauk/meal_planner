class AddRecipeRefToTagRecipe < ActiveRecord::Migration
  def change
    add_reference :tag_recipes, :recipe, index: true, foreign_key: true
  end
end
