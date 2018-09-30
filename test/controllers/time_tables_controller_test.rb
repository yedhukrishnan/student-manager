require 'test_helper'

class TimeTablesControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get time_tables_new_url
    assert_response :success
  end

end
