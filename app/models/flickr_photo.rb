class FlickrPhoto < ApplicationRecord
  belongs_to :instrument
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

  # we can store the response for convenience
  def photo_set
    begin
      Flickr::Photoset.new( self.embed, api_key).getPhotos
    rescue StandardError => e
      nil
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
