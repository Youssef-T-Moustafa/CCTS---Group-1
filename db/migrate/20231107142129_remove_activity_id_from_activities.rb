class RemoveActivityIdFromActivities < ActiveRecord::Migration[7.1]
  def change
    remove_column :activities, :activity_id, :integer
  end
end
