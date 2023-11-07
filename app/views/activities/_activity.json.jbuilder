json.extract! activity, :id, :activity_title, :description, :start_date, :end_date, :allocated_budget, :club_id, :achievement, :created_at, :updated_at
json.url activity_url(activity, format: :json)
