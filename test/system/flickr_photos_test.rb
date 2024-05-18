require "application_system_test_case"

class FlickrPhotosTest < ApplicationSystemTestCase
  setup do
    @flickr_photo = flickr_photos(:one)
  end

  test "visiting the index" do
    visit flickr_photos_url
    assert_selector "h1", text: "Flickr photos"
  end

  test "should create flickr photo" do
    visit flickr_photos_url
    click_on "New flickr photo"

    fill_in "Embed", with: @flickr_photo.embed
    click_on "Create Flickr photo"

    assert_text "Flickr photo was successfully created"
    click_on "Back"
  end

  test "should update Flickr photo" do
    visit flickr_photo_url(@flickr_photo)
    click_on "Edit this flickr photo", match: :first

    fill_in "Embed", with: @flickr_photo.embed
    click_on "Update Flickr photo"

    assert_text "Flickr photo was successfully updated"
    click_on "Back"
  end

  test "should destroy Flickr photo" do
    visit flickr_photo_url(@flickr_photo)
    click_on "Destroy this flickr photo", match: :first

    assert_text "Flickr photo was successfully destroyed"
  end
end
