require "test_helper"

class FlickrPhotosControllerTest < ActionDispatch::IntegrationTest
  setup do
    @flickr_photo = flickr_photos(:one)
  end

  test "should get index" do
    get flickr_photos_url
    assert_response :success
  end

  test "should get new" do
    get new_flickr_photo_url
    assert_response :success
  end

  test "should create flickr_photo" do
    assert_difference("FlickrPhoto.count") do
      post flickr_photos_url, params: { flickr_photo: { embed: @flickr_photo.embed } }
    end

    assert_redirected_to flickr_photo_url(FlickrPhoto.last)
  end

  test "should show flickr_photo" do
    get flickr_photo_url(@flickr_photo)
    assert_response :success
  end

  test "should get edit" do
    get edit_flickr_photo_url(@flickr_photo)
    assert_response :success
  end

  test "should update flickr_photo" do
    patch flickr_photo_url(@flickr_photo), params: { flickr_photo: { embed: @flickr_photo.embed } }
    assert_redirected_to flickr_photo_url(@flickr_photo)
  end

  test "should destroy flickr_photo" do
    assert_difference("FlickrPhoto.count", -1) do
      delete flickr_photo_url(@flickr_photo)
    end

    assert_redirected_to flickr_photos_url
  end
end
