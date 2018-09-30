require 'test_helper'

class WorkingDaysControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get working_days_new_url
    assert_response :success
  end

  test "should get index" do
    get working_days_index_url
    assert_response :success
  end

  test "should get delete" do
    get working_days_delete_url
    assert_response :success
  end

end
