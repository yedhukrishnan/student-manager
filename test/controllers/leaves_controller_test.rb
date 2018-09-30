require 'test_helper'

class LeavesControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get leaves_new_url
    assert_response :success
  end

  test "should get index" do
    get leaves_index_url
    assert_response :success
  end

  test "should get delete" do
    get leaves_delete_url
    assert_response :success
  end

end
