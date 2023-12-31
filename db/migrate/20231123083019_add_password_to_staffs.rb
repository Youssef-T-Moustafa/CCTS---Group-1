class AddPasswordToStaffs < ActiveRecord::Migration[7.1]
  def change
    add_column :staffs, :password, :string
  end
end
