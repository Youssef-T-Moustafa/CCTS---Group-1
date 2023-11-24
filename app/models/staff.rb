class Staff < ApplicationRecord
    has_many :club
    has_secure_password

    def full_name
        "#{first_name} #{last_name}"
    end

    def custom_authenticate(password)
        # Your custom authentication logic here
        # For example, compare the hashed password with the provided password
        BCrypt::Password.new(password_digest).is_password?(password)
    end

end