class AddAmountAndUnitToQuantities < ActiveRecord::Migration
  def change
    add_column :quantities, :amount, :integer
    add_column :quantities, :unit, :string
  end
end
