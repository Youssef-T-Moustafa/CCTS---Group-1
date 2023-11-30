class Student < ApplicationRecord
    has_many :attendances
    has_many :club_members
    has_many :clubs, through: :club_members
    has_secure_password

    #Add username (first_name+last_name+id)
    def full_name
        "#{first_name} #{last_name}"
    end
    
    def full_name
        "#{first_name} #{last_name}"
    end


    def custom_authenticate(password)
        # Your custom authentication logic here
        # For example, compare the hashed password with the provided password
        BCrypt::Password.new(password_digest).is_password?(password)
    end
end
