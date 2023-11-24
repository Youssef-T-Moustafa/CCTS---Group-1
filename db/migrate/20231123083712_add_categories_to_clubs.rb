class AddCategoriesToClubs < ActiveRecord::Migration[7.1]
  def change
    add_column :clubs, :categories, :string
  end
end
