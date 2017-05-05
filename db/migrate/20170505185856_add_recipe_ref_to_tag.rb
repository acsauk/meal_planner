class AddRecipeRefToTag < ActiveRecord::Migration
  def change
    add_reference :tags, :recipe, index: true, foreign_key: true
  end
end
