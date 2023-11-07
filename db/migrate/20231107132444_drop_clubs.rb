class DropClubs < ActiveRecord::Migration[6.0]
  def up
    drop_table :clubs
  end

  def down
    raise ActiveRecord::IrreversibleMigration
  end
end
