require "test_helper"

class Apps::IndexCardControllerTest < ActionDispatch::IntegrationTest
  test "should get main" do
    get apps_index_card_main_url
    assert_response :success
  end
end
