class AddQuantifiableIdAndQuantifiableTypeToQuantity < ActiveRecord::Migration
  def up
    add_column :quantities, :quantifiable_id, :integer
    add_column :quantities, :quantifiable_type, :string
  end

  def down
    remove_column :quantities, :quantifiable_id, :integer
    remove_column :quantities, :quantifiable_type, :string
  end
end
