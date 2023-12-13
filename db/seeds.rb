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

# db/seeds.rb

# Seed clubs
clubs = [
  {name: "Chess Club", description: "A club for chess enthusiasts of all levels"},
  {name: "Book Club", description: "A club for book lovers who want to share their thoughts and opinions"},
  {name: "Music Club", description: "A club for music fans who want to learn, play, and listen to different genres and instruments"}
]

clubs.each do |attributes|
  Club.find_or_create_by(attributes)
end

# Seed activities
activities = [
  {activity_title: "Chess Tournament", description: "A friendly competition among club members", start_date: "2023-01-15", end_date: "2023-01-16", requested_budget: 500.00, club: Club.find_by(name: "Chess Club"), status: "pending"},
  {activity_title: "Book Discussion", description: "A discussion on the book 'The Catcher in the Rye' by J.D. Salinger", start_date: "2023-01-20", end_date: "2023-01-20", requested_budget: 100.00, club: Club.find_by(name: "Book Club"), status: "pending"},
  {activity_title: "Music Workshop", description: "A workshop on how to play the guitar", start_date: "2023-01-25", end_date: "2023-01-25", requested_budget: 300.00, club: Club.find_by(name: "Music Club"), status: "approved"},
]

activities.each do |attributes|
  Activity.find_or_create_by(attributes)
end



