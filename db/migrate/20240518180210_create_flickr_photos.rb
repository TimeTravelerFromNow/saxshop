class CreateFlickrPhotos < ActiveRecord::Migration[7.1]
  def change
    create_table :flickr_photos do |t|
      t.text :embed

      t.timestamps
    end
  end
end
