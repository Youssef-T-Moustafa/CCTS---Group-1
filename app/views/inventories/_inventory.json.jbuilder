json.extract! inventory, :id, :name, :description, :quantity, :created_at, :updated_at
json.url inventory_url(inventory, format: :json)
