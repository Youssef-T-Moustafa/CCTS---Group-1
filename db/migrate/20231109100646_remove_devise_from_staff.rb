class RemoveDeviseFromStaff < ActiveRecord::Migration[7.1]
  def change
    drop_table :staffs
  end
end
