class DropClubs < ActiveRecord::Migration[7.1]
  def up
    drop_table :clubs
  end
end
