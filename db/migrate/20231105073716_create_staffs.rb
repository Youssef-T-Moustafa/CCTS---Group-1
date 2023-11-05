# db/migrate/[timestamp]_create_staffs.rb
class CreateStaffs < ActiveRecord::Migration[6.1]
  def change
    create_table :staffs do |t|
      t.string :staff_id
      t.string :first_name
      t.string :last_name
      # Add other necessary fields
      t.timestamps
    end
  end
end
