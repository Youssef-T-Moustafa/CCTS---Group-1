class RenameAllocatedBudgetToRequestedBudget < ActiveRecord::Migration[7.1]
  def change
    rename_column :activities, :allocated_budget, :requested_budget
  end
end
