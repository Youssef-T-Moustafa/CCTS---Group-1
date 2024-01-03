# app/models/student.rb
class Student < ApplicationRecord
    has_many :attendances
    has_many :club_members
    has_many :clubs, through: :club_members
    has_many :extra_activities
    has_secure_password
  
    def full_name
        "#{first_name} #{last_name}"
    end
    
    def self.search(search)
        if search
          where("first_name LIKE ? OR last_name LIKE ?", "%#{search}%", "%#{search}%")
        else
          all
        end
    end
end
