class AddColumnsToActivities < ActiveRecord::Migration[7.1]
  def change
    add_column :activities, :description, :text
    add_column :activities, :allocated_budget, :decimal
    add_column :activities, :achievement, :string
  end
end
