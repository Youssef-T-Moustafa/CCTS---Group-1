class RemoveColumnsFromStaff < ActiveRecord::Migration[7.1]
  def change
    remove_column :staffs, :staff_id, :string
  end
end
