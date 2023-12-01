class RemovePositionFromClubMembers < ActiveRecord::Migration[7.1]
  def change
    remove_column :club_members, :position
  end
end
