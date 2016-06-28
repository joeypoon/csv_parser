class Customer < ActiveRecord::Base
  include ParseCSV
  validates :first_name, :last_name, :address, :city, :state, :zip_code, presence: true
end
