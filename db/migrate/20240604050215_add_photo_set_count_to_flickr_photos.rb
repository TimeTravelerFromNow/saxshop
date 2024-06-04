class AddPhotoSetCountToFlickrPhotos < ActiveRecord::Migration[7.1]
  def change
    add_column :flickr_photos, :photo_set_count, :integer, :default => 0
  end
end
