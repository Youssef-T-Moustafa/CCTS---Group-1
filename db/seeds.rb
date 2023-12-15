require 'faker'

# Create 211 random students
211.times do |i|
  # Generate random phone number for parent
  parent_phone = "01#{rand(1..9)}#{rand(1_000_000..9_999_999)}"

  # Generate random names
  first_name = Faker::Name.first_name
  last_name = Faker::Name.last_name

  # Create student
  Student.create(
    first_name: first_name,
    last_name: last_name,
    gender: ['Male', 'Female'].sample,
    parent_phone: parent_phone,
    parent_email: "student#{i + 1}@student.com",
    password_digest: BCrypt::Password.create('stud1234'),
    score: 0
  )
end
