class AddCategoriesToClubMembers < ActiveRecord::Migration[6.0]
  def change
    add_column :club_members, :categories, :string
  end
end
