require "test_helper"

class SiteSettingsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @site_setting = site_settings(:one)
  end

  test "should get index" do
    get site_settings_url
    assert_response :success
  end

  test "should get new" do
    get new_site_setting_url
    assert_response :success
  end

  test "should create site_setting" do
    assert_difference("SiteSetting.count") do
      post site_settings_url, params: { site_setting: { about: @site_setting.about, contact: @site_setting.contact, google_tag: @site_setting.google_tag, motd: @site_setting.motd } }
    end

    assert_redirected_to site_setting_url(SiteSetting.last)
  end

  test "should show site_setting" do
    get site_setting_url(@site_setting)
    assert_response :success
  end

  test "should get edit" do
    get edit_site_setting_url(@site_setting)
    assert_response :success
  end

  test "should update site_setting" do
    patch site_setting_url(@site_setting), params: { site_setting: { about: @site_setting.about, contact: @site_setting.contact, google_tag: @site_setting.google_tag, motd: @site_setting.motd } }
    assert_redirected_to site_setting_url(@site_setting)
  end

  test "should destroy site_setting" do
    assert_difference("SiteSetting.count", -1) do
      delete site_setting_url(@site_setting)
    end

    assert_redirected_to site_settings_url
  end
end
