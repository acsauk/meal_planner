class RenameRecipeingredientsToRecipeIngredients < ActiveRecord::Migration
  def self.table_exists?(name)
    ActiveRecord::Base.connection.tables.include?(name)
  end

  if table_exists?(:recipeingredients)
    def self.up
      rename_table :recipeingredients, :recipe_ingredients
    end

    def self.down
      rename_table :recipe_ingredients, :recipeingredients
    end
  end
end
