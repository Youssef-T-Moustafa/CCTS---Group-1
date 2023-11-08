class DropStudents < ActiveRecord::Migration[7.1]
  def up
    drop_table :students
  end

end
