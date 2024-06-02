class AddFlickrPhotoToInstruments < ActiveRecord::Migration[7.1]
  def change
    add_reference :instruments, :flickr_photo, null: true, foreign_key: true
  end
end
