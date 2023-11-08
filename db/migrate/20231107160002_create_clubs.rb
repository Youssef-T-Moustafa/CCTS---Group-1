class CreateClubs < ActiveRecord::Migration[7.1]
  def change
    create_table :clubs do |t|
      t.string :name
      t.text :description
      t.decimal :budget
      t.integer :capacity

      t.timestamps
    end
  end
end
