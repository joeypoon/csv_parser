require 'test_helper'

class ParseCSVTest < ActiveSupport::TestCase
  def setup
    @class = Class.new do
      include ParseCSV
    end
  end

  test 'can properly parse csv' do
    parsed = @class.from_csv(File.open('./test/fixtures/example.csv'))
    expected = {
      :first_name=>"Tyson",
      :last_name=>"Hilpert",
      :address=>"Collier Trafficway",
      :city=>"Marceloshire",
      :state=>"AZ",
      :zip_code=>"42080"
    }
    assert_equal parsed.first, expected
  end
end
