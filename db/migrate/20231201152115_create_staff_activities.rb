class CreateStaffActivities < ActiveRecord::Migration[7.1]
  def change
    create_table :staff_activities do |t|
      t.references :staff, null: false, foreign_key: true
      t.references :activity, null: false, foreign_key: true

      t.timestamps
    end
  end
end
