class Customer < ActiveRecord::Base
  validates :first_name, :last_name, :address, :city, :state, :zip_code, presence: true
end
