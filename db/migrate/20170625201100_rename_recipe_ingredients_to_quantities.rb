class RenameRecipeIngredientsToQuantities < ActiveRecord::Migration
  def change
    rename_table :recipe_ingredients, :quantities
  end
end
