json.extract! donor, :id, :name, :blood_group, :dob, :state, :city, :address, :latitude, :longitude, :last_blood_donated, :contact_number, :e-mail_id, :created_at, :updated_at
json.url donor_url(donor, format: :json)
