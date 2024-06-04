class FlickrPhotosController < ApplicationController
  before_action :set_flickr_photo, only: %i[ show edit update destroy remove]
  before_action :set_instrument, only: %i[ update create ]


  # GET /flickr_photos or /flickr_photos.json
  def index
    @flickr_photos = FlickrPhoto.all
  end

  # GET /flickr_photos/1 or /flickr_photos/1.json
  def show
  end

  def remove
    instrument = @flickr_photo.instrument
    @flickr_photo.instrument = nil
    respond_to do |format|
      if @flickr_photo.save
        format.html { redirect_to instrument_path(instrument), notice: "Flickr photo was successfully removed." }
        format.json { render :show, status: :created, location: @flickr_photo }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @flickr_photo.errors, status: :unprocessable_entity }
      end
    end
  end

  # GET /flickr_photos/new
  def new
    @flickr_photo = FlickrPhoto.new
  end

  # GET /flickr_photos/1/edit
  def edit
  end

  # POST /flickr_photos or /flickr_photos.json
  def create
    @flickr_photo = FlickrPhoto.new(flickr_photo_params)
    @flickr_photo.instrument = @instrument
    respond_to do |format|
      if @flickr_photo.save
        format.html { redirect_to flickr_photo_url(@flickr_photo), notice: "Flickr photo was successfully created." }
        format.json { render :show, status: :created, location: @flickr_photo }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @flickr_photo.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /flickr_photos/1 or /flickr_photos/1.json
  def update
    @flickr_photo.instrument = @instrument

    respond_to do |format|
      if @flickr_photo.update(flickr_photo_params)
        format.html { redirect_to flickr_photo_url(@flickr_photo), notice: "Flickr photo was successfully updated." }
        format.json { render :show, status: :ok, location: @flickr_photo }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @flickr_photo.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /flickr_photos/1 or /flickr_photos/1.json
  def destroy
    @flickr_photo.destroy!

    respond_to do |format|
      format.html { redirect_to flickr_photos_url, notice: "Flickr photo was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_flickr_photo
      @flickr_photo = FlickrPhoto.find(params[:id] || params[:flickr_photo_id])
    end

    def set_instrument
      @instrument = Instrument.find(params[:instrument_id]) if params[:instrument_id]
    end

    # Only allow a list of trusted parameters through.
    def flickr_photo_params
      params.require(:flickr_photo).permit(:embed)
    end
end
