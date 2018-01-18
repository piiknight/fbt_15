require "test_helper"

class Admin::BookingtoursControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get admin_bookingtours_index_url
    assert_response :success
  end

  test "should get edit" do
    get admin_bookingtours_edit_url
    assert_response :success
  end

  test "should get new" do
    get admin_bookingtours_new_url
    assert_response :success
  end
end
