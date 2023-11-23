class CreateClubs < ActiveRecord::Migration[7.1]
  def change
    create_table :clubs do |t|
      t.string :name
      t.text :description
      t.decimal :budget
      t.integer :capacity
      t.references :staff, null: false, foreign_key: true

      t.timestamps
    end
  end
end
