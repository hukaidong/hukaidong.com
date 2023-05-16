require "test_helper"

class Apps::SteersimPlotControllerTest < ActionDispatch::IntegrationTest
  test "should get main" do
    get apps_steersim_plot_main_path
    assert_response :success
  end

  test "should get show" do
    get apps_steersim_plot_show_url
    assert_response :success
  end
end
