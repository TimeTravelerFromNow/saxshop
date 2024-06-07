json.extract! flickr_photo, :id, :embed, :created_at, :updated_at
json.url flickr_photo_url(flickr_photo, format: :json)
