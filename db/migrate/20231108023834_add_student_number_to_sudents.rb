class AddStudentNumberToSudents < ActiveRecord::Migration[7.1]
  def change
    add_column :students, :student_number, :string
  end
end
