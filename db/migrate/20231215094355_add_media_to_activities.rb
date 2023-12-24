class AddMediaToActivities < ActiveRecord::Migration[7.1]
  def change
    add_column :activities, :media, :json
  end
end
