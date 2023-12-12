class AddScoreToStudents < ActiveRecord::Migration[7.1]
  def change
    add_column :students, :score, :integer, default: 0 # Replace 0 with the default value you wan
  end
end
