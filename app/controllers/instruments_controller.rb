class InstrumentsController < ApplicationController
  before_action :set_instrument, only: :show
  # GET /instruments or /instruments.json
  def index
    @instruments = Instrument.all
  end

  # GET /instruments/1 or /instruments/1.json
  def show
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_instrument
      @instrument = Instrument.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def instrument_params
      params.require(:instrument)
    end
end
