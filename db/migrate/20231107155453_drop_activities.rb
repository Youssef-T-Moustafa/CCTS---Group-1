class DropActivities < ActiveRecord::Migration[6.0]
  def up
    drop_table :activities
  end


end
