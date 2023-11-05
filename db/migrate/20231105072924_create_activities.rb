# db/migrate/[timestamp]_create_activities.rb
class CreateActivities < ActiveRecord::Migration[6.1]
  def change
    create_table :activities do |t|
      t.string :activity_id
      t.string :activity_name
      # Add other necessary fields
      t.timestamps
    end
  end
end
