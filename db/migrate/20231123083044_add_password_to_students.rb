class AddPasswordToStudents < ActiveRecord::Migration[7.1]
  def change
    add_column :students, :password, :string
  end
end
