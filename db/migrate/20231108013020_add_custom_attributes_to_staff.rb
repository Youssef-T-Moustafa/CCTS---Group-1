class AddCustomAttributesToStaff < ActiveRecord::Migration[7.1]
  def change
    add_column :staffs, :first_name, :string
    add_column :staffs, :last_name, :string
    add_column :staffs, :gender, :string
    add_column :staffs, :phone, :string
  end
end
