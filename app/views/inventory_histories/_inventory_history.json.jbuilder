json.extract! inventory_history, :id, :inventory_id, :quantity, :created_at, :updated_at
json.url inventory_history_url(inventory_history, format: :json)
