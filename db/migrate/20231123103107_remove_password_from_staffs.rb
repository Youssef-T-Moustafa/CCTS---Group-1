class RemovePasswordFromStaffs < ActiveRecord::Migration[7.1]
  def change
    remove_column :staffs, :password, :string
  end
end
