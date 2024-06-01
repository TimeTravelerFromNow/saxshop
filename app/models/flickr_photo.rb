class FlickrPhoto < ApplicationRecord

  # api
  def self.flickr
    if @flickr.nil?
      puts 'FlickrPhoto.flickr :: Initializing flickr API'
    end
    @flickr ||= Flickr.new(api_key)
  end

  # app flickr user
  def self.user(params = { nsid: '47387225@N00', username: 'bandit_sgray'})
    @user ||= Flickr::User.new(params)
  end

  def get_photo_set( set_id = nil)
    begin
      Flickr::Photoset.new(set_id || self.embed, api_key).getPhotos
    rescue StandardError => e
      e.to_s
    end
  end

  private

  def api_key
    Rails.application.credentials.flickr.api_key
  end

    def self.api_key
      Rails.application.credentials.flickr.api_key
    end
end
