class RemoveStaffIdFromClubs < ActiveRecord::Migration[6.0]

#RUN THESE COMMANDS BELOW TO SOLVE ERRORsss
#Run these things first inside rails console, then delete the above line 
# Club.delete_all
# Activity.delete_all 
#This is to prevent errors since we are changing the clubs later





  def change
    remove_reference :clubs, :staff, foreign_key: true
  end
end
