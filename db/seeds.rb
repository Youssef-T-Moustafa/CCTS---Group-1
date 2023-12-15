# In your seeds.rb file or a new migration
Club.where(category: 'Uniformed Units').delete_all

# Add the correct clubs with the new category name
uniform_clubs = [
  "Briged Bakti Malaysia",
  "Pergerakan Puteri Islam Malaysia",
  "Taekwondo",
  "Silat"
]

uniform_clubs.each do |club_name|
  Club.create(
    name: club_name,
    description: "This is the #{club_name} Club",
    budget: 0,
    capacity: 60,
    category: "Uniformed Units"
  )
end
