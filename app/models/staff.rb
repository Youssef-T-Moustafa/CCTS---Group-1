class Staff < ApplicationRecord
    has_many :club_advisors
    has_many :clubs, through: :club_advisors
    has_many :staff_activities
    has_many :activities, through: :staff_activities
    has_secure_password

    #Add username (first_name+last_name+id)
    def full_name
        "#{first_name} #{last_name}"
    end


end