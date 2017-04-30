json.extract! receiver, :id, :name, :blood_group, :dob, :address, :latitude, :longitude, :contact_number, :email_id, :description, :created_at, :updated_at
json.url receiver_url(receiver, format: :json)
