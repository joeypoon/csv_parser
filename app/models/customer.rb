class Customer < ActiveRecord::Base
  include ParseCSV
  validates :first_name, :last_name, :address, :city, :state, :zip_code, presence: true

  def self.search keyword
    if keyword.present?
      where(
        "first_name ilike :k OR
        last_name ilike :k OR
        address ilike :k OR
        city ilike :k OR
        state ilike :k OR
        zip_code ilike :k",
        k: "%#{keyword}%"
      )
    end
  end
end
