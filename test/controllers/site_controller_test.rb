require "test_helper"

class SiteControllerTest < ActionDispatch::IntegrationTest
  test "should get home" do
    get site_home_url
    assert_response :success
  end

  test "should get map" do
    get site_map_url
    assert_response :success
  end
end
