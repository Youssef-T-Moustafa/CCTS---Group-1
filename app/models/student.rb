class Student < ApplicationRecord
    has_many :attendance

    def full_name
        "#{first_name} #{last_name}"
    end
end
