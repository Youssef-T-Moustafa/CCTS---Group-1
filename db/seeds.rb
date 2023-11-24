# db/seeds.rb

require 'faker'

15.times do
  Student.create!(
    first_name: Faker::Name.first_name,
    last_name: Faker::Name.last_name,
    gender: Faker::Gender.binary_type,
    parent_phone: Faker::PhoneNumber.cell_phone,
    parent_email: Faker::Internet.email
  )
end
