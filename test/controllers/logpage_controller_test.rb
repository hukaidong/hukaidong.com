require "test_helper"

class LogpageControllerTest < ActionDispatch::IntegrationTest
  test "should get production" do
    get logpage_production_url
    assert_response :success
  end

  test "should get development" do
    get logpage_development_url
    assert_response :success
  end

  test "should get test" do
    get logpage_test_url
    assert_response :success
  end
end
