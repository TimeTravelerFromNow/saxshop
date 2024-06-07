class Admin::InstrumentsController < AdminController
  before_action :set_instrument, only: %i[ show edit update destroy remove_flickr_photo ]
  before_action :assign_relations, only: :update
  # GET /instruments or /instruments.json
  def index
    @instruments = Instrument.all
  end

  # GET /instruments/1 or /instruments/1.json
  def show
  end

  def remove_flickr_photo
    @instrument.flickr_photo = nil
    respond_to do |format|
      if @instrument.save
        format.html { redirect_to admin_instrument_url(@instrument), notice: "removed the flickr photo successfully" }
        format.json { render :show, status: :created, location: @instrument }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @instrument.errors, status: :unprocessable_entity }
      end
    end
  end

  # GET /instruments/new
  def new
    @instrument = Instrument.new
  end

  # GET /instruments/1/edit
  def edit
  end

  # POST /instruments or /instruments.json
  def create
    @instrument = Instrument.new(instrument_params)

    respond_to do |format|
      if @instrument.save
        format.html { redirect_to admin_instrument_url(@instrument), notice: "Instrument was successfully created." }
        format.json { render :show, status: :created, location: @instrument }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @instrument.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /instruments/1 or /instruments/1.json
  def update
    respond_to do |format|
      if @instrument.update(instrument_params)
        format.html { redirect_to admin_instrument_url(@instrument), notice: "Instrument was successfully updated." }
        format.json { render :show, status: :ok, location: @instrument }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @instrument.errors, status: :unprocessable_entity }
      end
    end
  end

  def unassign_flickr_photo
    @instrument.flickr_photo = nil
    @instrument.save
    redirect_to admin_instrument_url(@instrument), notice: "Instrument was successfully updated."
  end

  # DELETE /instruments/1 or /instruments/1.json
  def destroy
    @instrument.destroy!

    respond_to do |format|
      format.html { redirect_to admin_instruments_url, notice: "Instrument was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    def assign_relations
      @instrument.make = Make.find_by!(slug: params[:make_slug]) if params[:make_slug]
      @instrument.flickr_photo = FlickrPhoto.find(instrument_params[:flickr_photo_id]) if instrument_params[:flickr_photo_id]
    end
    # Use callbacks to share common setup or constraints between actions.
    def set_instrument
      @instrument = Instrument.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def instrument_params
      params.require(:instrument).permit(:flickr_photo_id,:manafacturer, :model_type, :serial_no, :condition, :year, :year_est, :price, :details)
    end
end
