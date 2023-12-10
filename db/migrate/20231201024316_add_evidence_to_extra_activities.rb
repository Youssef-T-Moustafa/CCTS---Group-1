class AddEvidenceToExtraActivities < ActiveRecord::Migration[7.1]
  def change
    add_column :extra_activities, :evidence, :text
  end
end
