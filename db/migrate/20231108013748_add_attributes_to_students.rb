class AddAttributesToStudents < ActiveRecord::Migration[7.1]
  def change
    add_column :students, :first_name, :string
    add_column :students, :last_name, :string
    add_column :students, :gender, :string
    add_column :students, :parent_phone, :string

  end
end
