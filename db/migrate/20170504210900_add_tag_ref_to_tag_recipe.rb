class AddTagRefToTagRecipe < ActiveRecord::Migration
  def change
    add_reference :tag_recipes, :tag, index: true, foreign_key: true
  end
end
