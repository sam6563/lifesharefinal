class CreateDonors < ActiveRecord::Migration
  def change
    create_table :donors do |t|
      t.string :name
      t.string :blood_group
      t.date :dob
      t.string :state
      t.string :city
      t.string :address
      t.float :latitude
      t.float :longitude
      t.date :last_blood_donated
      t.string :contact_number
      t.string :email_id

      t.timestamps null: false
    end
  end
end
