require "test_helper"

class Public::TargetsControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get public_targets_new_url
    assert_response :success
  end

  test "should get index" do
    get public_targets_index_url
    assert_response :success
  end

  test "should get show" do
    get public_targets_show_url
    assert_response :success
  end

  test "should get edit" do
    get public_targets_edit_url
    assert_response :success
  end
end
