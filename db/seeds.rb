# Create some staff records
Staff.create!(first_name: "Uknow1", email: "Uknow1@staff.com", password: "12345678", password_confirmation: "12345678")
Staff.create!(first_name: "Uknow1", email: "Uknow2@staff.com", password: "12345678", password_confirmation: "12345678")
Staff.create!(first_name: "Uknow1", email: "Uknow2@staff.com", password: "12345678", password_confirmation: "12345678")

# Create some student records
Student.create!(first_name: "Known1", parent_email: "Known1@parent.com", password: "12345678", password_confirmation: "12345678")
Student.create!(first_name: "Known2", parent_email: "Known2@parent.com", password: "12345678", password_confirmation: "12345678")
Student.create!(first_name: "Known3", parent_email: "Known3@parent.com", password: "12345678", password_confirmation: "12345678")
