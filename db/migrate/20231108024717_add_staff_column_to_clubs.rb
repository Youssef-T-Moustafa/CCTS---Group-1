class AddStaffColumnToClubs < ActiveRecord::Migration[7.1]
  def change
    add_reference :clubs, :staff, null: true, foreign_key: true
  end
end
