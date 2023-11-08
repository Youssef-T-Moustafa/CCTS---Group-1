class DestroyStaff < ActiveRecord::Migration[7.1]
  def up
    drop_table :staffs
  end
end
