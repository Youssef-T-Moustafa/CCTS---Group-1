class CreateActivities < ActiveRecord::Migration[7.1]
  def change
    create_table :activities do |t|
      t.string :activity_title
      t.text :description
      t.date :start_date
      t.date :end_date
      t.decimal :allocated_budget
      t.references :club, null: false, foreign_key: true
      t.string :achievement

      t.timestamps
    end
  end
end
