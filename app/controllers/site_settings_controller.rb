class SiteSettingsController < ApplicationController
  before_action :set_site_setting, only: %i[ show edit update destroy ]

  # GET /site_settings or /site_settings.json
  def index
    @site_settings = SiteSetting.all
  end

  # GET /site_settings/1 or /site_settings/1.json
  def show
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_site_setting
      @site_setting = SiteSetting.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def site_setting_params
      params.require(:site_setting)
    end
end
