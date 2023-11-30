class Student < ApplicationRecord
    has_many :attendances
    has_many :club_members
    has_many :clubs, through: :club_members
    has_many :extra_activities
    has_secure_password

    def full_name
        "#{first_name} #{last_name}"
    end
    
end
