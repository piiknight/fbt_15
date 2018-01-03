require "test_helper"

module Admin
  class CategoryControllerTest < ActionDispatch::IntegrationTest
    test "should get index" do
      get admin_category_index_url
      assert_response :success
    end

    test "should get new" do
      get admin_category_new_url
      assert_response :success
    end

    test "should get edit" do
      get admin_category_edit_url
      assert_response :success
    end
  end
end
