class AddUserIdToDonors < ActiveRecord::Migration
  def change
    add_reference :donors, :user, index: true, foreign_key: true
  end
end
