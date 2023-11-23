class Student < ApplicationRecord
    has_many :attendances

    def full_name
        "#{first_name} #{last_name}"
    end
end
