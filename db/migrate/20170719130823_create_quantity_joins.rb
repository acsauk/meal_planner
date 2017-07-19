class CreateQuantityJoins < ActiveRecord::Migration
  def change
    create_table :quantity_joins do |t|
      t.integer :quantity_id, null: false
      t.integer :quantifiable_id, null: false
      t.string :quantifiable_type, null: false

      t.timestamps null: false
    end
    add_index :quantity_joins, %i[quantity_id quantifiable_id quantifiable_type],
              unique: true, name:
              'index_quantity_joins_on_quantity_id_quantifiable_id_and_type'
  end
end
