class SiteSettingsController < ApplicationController
  before_action :set_site_setting, only: %i[ show edit update destroy ]

  # GET /site_settings or /site_settings.json
  def index
    @site_settings = SiteSetting.all
  end

  # GET /site_settings/1 or /site_settings/1.json
  def show
  end

  # GET /site_settings/new
  def new
    @site_setting = SiteSetting.new
    if SiteSetting.active.present?
      redirect_to '/'
    end
  end

  # GET /site_settings/1/edit
  def edit
    @site_setting = SiteSetting.new if !SiteSetting.first.present?
  end

  # POST /site_settings or /site_settings.json
  def create
    return if SiteSetting.active.present?
    @site_setting = SiteSetting.new(site_setting_params)

    respond_to do |format|
      if @site_setting.save
        format.html { redirect_to site_setting_url(@site_setting), notice: "Site setting was successfully created." }
        format.json { render :show, status: :created, location: @site_setting }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @site_setting.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /site_settings/1 or /site_settings/1.json
  def update
    respond_to do |format|
      if @site_setting.update(site_setting_params)
        format.html { redirect_to site_setting_url(@site_setting), notice: "Site setting was successfully updated." }
        format.json { render :show, status: :ok, location: @site_setting }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @site_setting.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /site_settings/1 or /site_settings/1.json
  def destroy
    @site_setting.destroy!

    respond_to do |format|
      format.html { redirect_to site_settings_url, notice: "Site setting was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_site_setting
      @site_setting = SiteSetting.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def site_setting_params
      params.require(:site_setting).permit(:portrait, :google_tag, :motd, :about, :contact)
    end
end
