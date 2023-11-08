class DropExtraActivities < ActiveRecord::Migration[7.1]
  def up
    drop_table :extra_activities
  end
end
