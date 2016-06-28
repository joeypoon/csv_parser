require 'test_helper'

class CustomerTest < ActiveSupport::TestCase
  test 'validates first_name' do
    customer = build_stubbed :customer, first_name: nil
    assert_not customer.valid?
  end

  test 'validates last_name' do
    customer = build_stubbed :customer, last_name: nil
    assert_not customer.valid?
  end

  test 'validates address' do
    customer = build_stubbed :customer, address: nil
    assert_not customer.valid?
  end

  test 'validates city' do
    customer = build_stubbed :customer, city: nil
    assert_not customer.valid?
  end

  test 'validates state' do
    customer = build_stubbed :customer, state: nil
    assert_not customer.valid?
  end

  test 'validates zip_code' do
    customer = build_stubbed :customer, zip_code: nil
    assert_not customer.valid?
  end
end
