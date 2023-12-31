class RenameCategoriesToCategoryInClubs < ActiveRecord::Migration[7.1]
  def change
    rename_column :clubs, :categories, :category
  end
end
