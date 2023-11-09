json.extract! staff, :id, :first_name, :last_name, :gender, :email, :phone, :created_at, :updated_at
json.url staff_url(staff, format: :json)
