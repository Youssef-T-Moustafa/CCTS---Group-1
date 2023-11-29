class Staff < ApplicationRecord
    has_many :club_advisors
    has_many :clubs, through: :club_advisors
    has_secure_password

    def full_name
        "#{first_name} #{last_name}"
    end


end