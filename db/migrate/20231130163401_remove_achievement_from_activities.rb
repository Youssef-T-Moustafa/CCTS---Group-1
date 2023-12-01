class RemoveAchievementFromActivities < ActiveRecord::Migration[7.1]
  def change
    remove_column :activities, :achievement
  end
end
