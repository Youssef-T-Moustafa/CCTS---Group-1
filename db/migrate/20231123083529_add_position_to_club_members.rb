class AddPositionToClubMembers < ActiveRecord::Migration[7.1]
  def change
    add_column :club_members, :position, :string
  end
end
