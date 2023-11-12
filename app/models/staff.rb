class Staff < ApplicationRecord
    has_many :club

    def full_name
        "#{first_name} #{last_name}"
    end
end