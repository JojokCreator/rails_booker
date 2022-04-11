json.extract! booking, :id, :name, :number_of_people, :start_time, :end_time, :user_id, :created_at, :updated_at
json.url booking_url(booking, format: :json)
