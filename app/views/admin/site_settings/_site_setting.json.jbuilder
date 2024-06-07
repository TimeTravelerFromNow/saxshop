json.extract! site_setting, :id, :google_tag, :motd, :about, :contact, :created_at, :updated_at
json.url site_setting_url(site_setting, format: :json)
