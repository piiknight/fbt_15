require "test_helper"

class BookingtourControllerTest < ActionDispatch::IntegrationTest
  test "should get create" do
    get bookingtour_create_url
    assert_response :success
  end
end
