class MakesController < ApplicationController
  before_action :set_make, only: %i[ show edit update destroy pick ]

  # GET /makes or /makes.json
  def index
    @makes = Make.all
  end

  # GET /makes/1 or /makes/1.json
  def show
  end

  def pick

  end

  # GET /makes/new
  def new
    @make = Make.new
  end

  # GET /makes/1/edit
  def edit
  end

  # POST /makes or /makes.json
  def create
    @make = Make.new(make_params)
    @make.category = Category.find_by(slug: params[:category_slug]) if params[:category_slug]

    respond_to do |format|
      if @make.save
        format.html { redirect_to make_url(@make), notice: "Make was successfully created." }
        format.json { render :show, status: :created, location: @make }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @make.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /makes/1 or /makes/1.json
  def update
    respond_to do |format|
      if @make.update(make_params)
        format.html { redirect_to make_url(@make), notice: "Make was successfully updated." }
        format.json { render :show, status: :ok, location: @make }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @make.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /makes/1 or /makes/1.json
  def destroy
    @make.destroy!

    respond_to do |format|
      format.html { redirect_to makes_url, notice: "Make was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_make
      @make = Make.find_by!(slug: params[:slug])
    end

    # Only allow a list of trusted parameters through.
    def make_params
      params.require(:make).permit(:title, :slug)
    end
end
