class RenameColumnsInActivities < ActiveRecord::Migration[7.1]
  def change
    rename_column :activities, :title, :activity_title
  rename_column :activities, :budget, :allocated_budget

  end
end
