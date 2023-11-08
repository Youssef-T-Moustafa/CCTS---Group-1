class CreateExtraActivities < ActiveRecord::Migration[7.1]
  def change
    create_table :extra_activities do |t|
      t.string :name
      t.text :description
      t.references :student, null: false, foreign_key: true
      t.date :start_date
      t.date :end_date

      t.timestamps
    end
  end
end
