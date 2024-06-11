class MakesController < ApplicationController
  before_action :set_make, only: :show

  # GET /makes or /makes.json
  def index
    @makes = Make.all
  end

  # GET /makes/1 or /makes/1.json
  def show
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_make
      @make = Make.find_by!(slug: params[:slug])
    end

    # Only allow a list of trusted parameters through.
    def make_params
      params.require(:make)
    end
end
