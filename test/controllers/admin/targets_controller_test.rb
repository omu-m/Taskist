require "test_helper"

class Admin::TargetsControllerTest < ActionDispatch::IntegrationTest
  test "should get show" do
    get admin_targets_show_url
    assert_response :success
  end

  test "should get destroy" do
    get admin_targets_destroy_url
    assert_response :success
  end
end
