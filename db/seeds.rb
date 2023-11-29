# Assuming this code is in a Rails console or a script
(1..10).each do |i|
    Student.create!(
      first_name: "Student#{i}",
      last_name: "test",
      parent_email: "Student#{i}@parent.com",
      password: "12345678",
      password_confirmation: "12345678"
    )
  end

  # Assuming this code is in a Rails console or a script
(1..3).each do |i|
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
  