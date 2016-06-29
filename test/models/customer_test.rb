require 'test_helper'

class CustomerTest < ActiveSupport::TestCase
  def attributes
    %i(first_name last_name address city state zip_code)
  end

  test 'validates attributes' do
    attributes.each do |attr|
      customer = build_stubbed :customer, attr => nil
      assert_not customer.valid?
    end
  end

  test 'can search by attributes' do
    customer = create :customer
    attributes.each do |attr|
      customers = Customer.search(customer[attr])
      assert customers.include?(customer)
    end
  end
end
