class Receiver < ActiveRecord::Base
	geocoded_by :address   
    after_validation :geocode, :if => :address_changed? 

    belongs_to :user
    validates :name, :presence => true
    validates :blood_group, :presence => true
   
    validates :address, :presence => true
    validates :contact_number, :presence => true
    validates :description, :presence => true

    BLOOD_GROUP = ["A +ve","A -ve", "B +ve","B -ve", "AB +ve","AB -ve", "O +ve","O -ve"]
end
