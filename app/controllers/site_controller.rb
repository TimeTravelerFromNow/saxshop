class SiteController < ApplicationController
  def home
    @site_setting = SiteSetting.active
  end

  def map
    @site_setting = SiteSetting.active
  end

  def google_tag
    @site_setting = SiteSetting.active
  end
end
