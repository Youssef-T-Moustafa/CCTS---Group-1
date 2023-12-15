class ChangeEvidenceToJsonInExtraActivities < ActiveRecord::Migration[7.1]
  def change
    change_column :extra_activities, :evidence, :json
  end
end
