require "application_system_test_case"

class SiteSettingsTest < ApplicationSystemTestCase
  setup do
    @site_setting = site_settings(:one)
  end

  test "visiting the index" do
    visit site_settings_url
    assert_selector "h1", text: "Site settings"
  end

  test "should create site setting" do
    visit site_settings_url
    click_on "New site setting"

    fill_in "About", with: @site_setting.about
    fill_in "Contact", with: @site_setting.contact
    fill_in "Google tag", with: @site_setting.google_tag
    fill_in "Motd", with: @site_setting.motd
    click_on "Create Site setting"

    assert_text "Site setting was successfully created"
    click_on "Back"
  end

  test "should update Site setting" do
    visit site_setting_url(@site_setting)
    click_on "Edit this site setting", match: :first

    fill_in "About", with: @site_setting.about
    fill_in "Contact", with: @site_setting.contact
    fill_in "Google tag", with: @site_setting.google_tag
    fill_in "Motd", with: @site_setting.motd
    click_on "Update Site setting"

    assert_text "Site setting was successfully updated"
    click_on "Back"
  end

  test "should destroy Site setting" do
    visit site_setting_url(@site_setting)
    click_on "Destroy this site setting", match: :first

    assert_text "Site setting was successfully destroyed"
  end
end
