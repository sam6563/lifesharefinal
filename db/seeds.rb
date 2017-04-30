# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
   #
if User.count == 0
   User.create(email:'simpleshan96@yahoo.in', password:'12345678',password_confirmation:'12345678',admin: true)
end
