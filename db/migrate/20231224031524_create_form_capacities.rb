class CreateFormCapacities < ActiveRecord::Migration[6.0]
  def change
    create_table :form_capacities do |t|
      t.references :club, foreign_key: true
      t.integer :f1
      t.integer :f2
      t.integer :f3
      t.integer :f4
      t.integer :f5

      t.timestamps
    end
  end
end
