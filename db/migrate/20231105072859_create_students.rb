# db/migrate/[timestamp]_create_students.rb
class CreateStudents < ActiveRecord::Migration[6.1]
  def change
    create_table :students do |t|
      t.string :student_id
      t.string :first_name
      t.string :last_name
      # Add other necessary fields
      t.timestamps
    end
  end
end
