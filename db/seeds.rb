require 'faker'

# Names from the list
names = [
  "Cikgu Amirah", "Ustazah Shaida", "Cikgu Majidah",
  "Cikgu Hadri", "Cikgu Zaihasra", "Cikgu Aina",
  "Cikgu Shafiq", "Ust. Za'im", "Ust. Azli",
  "Ust. Amien", "Cikgu Fairuz", "Cikgu Adli",
  "Cikgu Zafirah", "Ustz. Hana", "Ust. Najmi",
  "Cikgu Rohayu", "Cikgu Jannah", "Cikgu Syafiq"
]

# Create staff members
names.each do |name|
  # Identify gender based on name
  gender = name.downcase.include?('ust') ? 'Male' : 'Female'

  # Generate random Malaysian phone number
  phone_number = "01#{rand(1..9)}#{rand(1_000_000..9_999_999)}"

  # Extract first and last names
  first_name, last_name = name.split(' ', 2)

  # Create staff member
  Staff.create(
    first_name: first_name,
    last_name: last_name,
    gender: gender,
    email: "#{last_name.downcase}@staff.com",
    phone: phone_number,
    password_digest: BCrypt::Password.create('staff1234')
  )
end

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

# Academic Clubs
Club.create(name: "International Language", description: "This is the International Language Club.", budget: 0, capacity: 60, category: "Academic")
Club.create(name: "Innovation And Creativity", description: "This is the Innovation And Creativity Club.", budget: 0, capacity: 60, category: "Academic")
Club.create(name: "Culture (Nasyid)", description: "This is the Culture (Nasyid) Club.", budget: 0, capacity: 60, category: "Academic")
Club.create(name: "Nature Lover", description: "This is the Nature Lover Club.", budget: 0, capacity: 60, category: "Academic")
Club.create(name: "Art And Khat", description: "This is the Art And Khat Club.", budget: 0, capacity: 60, category: "Academic")

# Uniformed Units Clubs
Club.create(name: "Briged Bakti Malaysia", description: "This is the Briged Bakti Malaysia Club.", budget: 0, capacity: 60, category: "Uniformed Units")
Club.create(name: "Pergerakan Puteri Islam Malaysia", description: "This is the Pergerakan Puteri Islam Malaysia Club.", budget: 0, capacity: 60, category: "Uniformed Units")
Club.create(name: "Taekwondo", description: "This is the Taekwondo Club.", budget: 0, capacity: 60, category: "Uniformed Units")
Club.create(name: "Silat", description: "This is the Silat Club.", budget: 0, capacity: 60, category: "Uniformed Units")

# Sports Clubs
Club.create(name: "Badminton", description: "This is the Badminton Club.", budget: 0, capacity: 60, category: "Sports")
Club.create(name: "Slap Ball", description: "This is the Slap Ball Club.", budget: 0, capacity: 60, category: "Sports")
Club.create(name: "Net Ball", description: "This is the Net Ball Club.", budget: 0, capacity: 60, category: "Sports")
Club.create(name: "Ping Pong", description: "This is the Ping Pong Club.", budget: 0, capacity: 60, category: "Sports")
Club.create(name: "Chess", description: "This is the Chess Club.", budget: 0, capacity: 60, category: "Sports")

# Seed for Admin
Admin.create(
  first_name: "Ustaz",
  last_name: "Hussein",
  email: "hussein@admin.com",
  phone: "0123456789",
  password_digest: BCrypt::Password.create('admin1234')
)


# Assuming this code is in a Rails console or a script
(1..50).each do |i|
  Student.create!(
    first_name: "Student#{i}",
    last_name: "test",
    parent_email: "Student#{i}@parent.com",
    password: "12345678",
    password_confirmation: "12345678"
  )
end

# Assuming this code is in a Rails console or a script
(1..20).each do |i|
  Staff.create!(
    first_name: "Staff#{i}",
    last_name: "test",
    email: "staff#{i}@staff.com",
    password: "12345678",
    password_confirmation: "12345678"
  )
end

(1..3).each do |i|
Admin.create!(
  first_name: "Admin#{i}",
  last_name: "test",
  email: "Admin#{i}@admin.com",
  password: "12345678",
  password_confirmation: "12345678"
)
end