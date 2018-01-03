require "test_helper"

class HistoryBookingsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get history_bookings_index_url
    assert_response :success
  end
end
