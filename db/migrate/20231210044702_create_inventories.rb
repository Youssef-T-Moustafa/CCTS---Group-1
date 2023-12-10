class CreateInventories < ActiveRecord::Migration[7.1]
  def change
    create_table :inventories do |t|
      t.string :name
      t.string :description
      t.integer :quantity

      t.timestamps
    end
  end
end
