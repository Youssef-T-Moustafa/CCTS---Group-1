class CreateClubAdvisors < ActiveRecord::Migration[7.1]
  def change
    create_table :club_advisors do |t|
      t.references :club, null: false, foreign_key: true
      t.references :staff, null: false, foreign_key: true

      t.timestamps
    end
  end
end
