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

# Assuming you have the Club model with an ID of 1, replace it with the actual ID if needed

(1..10).each do |i|
  Activity.create!(
    activity_title: "Activity#{i}",
    description: "Description for Activity#{i}",
    start_date: Date.today + i.days,
    end_date: Date.today + (i + 5).days,
    club_id: 1,
  )
end

(1..20).each do |i|
  Activity.create!(
    activity_title: "Activity#{i}",
    description: "Description for Activity#{i}",
    start_date: Date.today + i.days,
    end_date: Date.today + (i + 5).days,
    club_id: 2,
  )
end


(1..90).each do |i|
  Activity.create!(
    activity_title: "Activity#{i}",
    description: "Description for Activity#{i}",
    start_date: Date.today + i.days,
    end_date: Date.today + (i + 5).days,
    club_id: 2,
  )
end

  