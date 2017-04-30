class CreateReceivers < ActiveRecord::Migration
  def change
    create_table :receivers do |t|
      t.string :name
      t.string :blood_group
      t.date :dob
      t.string :address
      t.float :latitude
      t.float :longitude
      t.string :contact_number
      t.string :email_id
      t.text :description

      t.timestamps null: false
    end
  end
end
