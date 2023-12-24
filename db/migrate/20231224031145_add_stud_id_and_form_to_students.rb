class AddStudIdAndFormToStudents < ActiveRecord::Migration[6.0]
  def change
    add_column :students, :stud_id, :string
    add_column :students, :form, :integer
  end
end
