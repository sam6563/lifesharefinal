class Donor < ActiveRecord::Base
	geocoded_by :address   
    after_validation :geocode, :if => :address_changed? 

    belongs_to :user
    validates :name, :presence => true
    validates :blood_group, :presence => true
    validates :state, :presence => true
    validates :city,  :presence => true
    validates :address, :presence => true
    validates :contact_number, :presence => true

    def self.search(donors)
  where("address LIKE ?", "%#{search}%") 
  
end
    


    BLOOD_GROUP = ["A +ve","A -ve", "B +ve","B -ve", "AB +ve","AB -ve", "O +ve","O -ve"] 
    STATE =["Andaman and Nicobar Islands", "Andhra Pradesh", "Arunachal Pradesh","Assam","Bihar","Chandigarh","Chhattisgarh","Dadra and Nagar Haveli","Daman and Diu","National Capital Territory of Delhi","Goa","Gujarat","Haryana","Himachal Pradesh","Jammu and Kashmir","Jharkhand","Karnataka","Kerala","Lakshadweep","Madhya Pradesh","Maharashtra","Manipur","Meghalaya","Mizoram","Nagaland","Odisha","Puducherry","Punjab","Rajasthan","Sikkim","Tamil Nadu","Telangana","Tripura","Uttar Pradesh","Uttarakhand","West Bengal"]
end 