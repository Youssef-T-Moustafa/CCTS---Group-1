class CreateStudents < ActiveRecord::Migration[7.1]
  def change
    create_table :students do |t|
      t.string :first_name
      t.string :last_name
      t.string :gender
      t.string :parent_phone
      t.string :parent_email

      t.timestamps
    end
  end
end
