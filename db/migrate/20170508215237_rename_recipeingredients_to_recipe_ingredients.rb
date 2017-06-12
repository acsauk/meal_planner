class RenameRecipeingredientsToRecipeIngredients < ActiveRecord::Migration
  def self.up
    rename_table :recipeingredients, :recipe_ingredients
  end

  def self.down
    rename_table :recipe_ingredients, :recipeingredients
  end
end
