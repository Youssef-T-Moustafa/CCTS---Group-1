class RemoveCategoriesFromClubMembers < ActiveRecord::Migration[7.1]
  def change
    remove_column :club_members, :categories, :string
  end
end
