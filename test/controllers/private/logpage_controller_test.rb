require "test_helper"

class Private::LogpageControllerTest < ActionDispatch::IntegrationTest
  test "should get production" do
    get private_plog_url
    assert_response :success
  end

  test "should get development" do
    get private_dlog_url
    assert_response :success
  end

  test "should get test" do
    get private_tlog_url
    assert_response :success
  end
end
