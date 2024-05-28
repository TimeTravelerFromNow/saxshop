class CreateSiteSettings < ActiveRecord::Migration[7.1]
  def change
    create_table :site_settings do |t|
      t.text :google_tag
      t.string :motd
      t.text :about
      t.string :contact

      t.timestamps
    end
  end
end
