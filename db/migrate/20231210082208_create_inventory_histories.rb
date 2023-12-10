class CreateInventoryHistories < ActiveRecord::Migration[7.1]
  def change
    create_table :inventory_histories do |t|
      t.references :inventory, null: false, foreign_key: true
      t.integer :quantity

      t.timestamps
    end
  end
end
