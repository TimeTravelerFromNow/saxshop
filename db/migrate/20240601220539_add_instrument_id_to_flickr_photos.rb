class AddInstrumentIdToFlickrPhotos < ActiveRecord::Migration[7.1]
  def change
    add_reference :flickr_photos, :instrument, null: true, foreign_key: true
  end
end
