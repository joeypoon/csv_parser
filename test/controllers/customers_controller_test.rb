require 'test_helper'

class CustomersControllerTest < ActionController::TestCase
  test 'can get index' do
    get :index
    assert_response 200
    assert_not_nil assigns(:customers)
  end

  test 'can get new' do
    get :new
    assert_response 200
    assert_not_nil assigns(:customer)
  end

  test 'can post create' do
    file = Rack::Test::UploadedFile.new(File.join(Rails.root, 'test', 'fixtures', 'example.csv'))
    params = { customer: { csv: file } }
    assert_difference 'Customer.count' do
      post :create, params
      assert_response 302
    end
  end
end
