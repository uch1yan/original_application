class FamiliesController < ApplicationController
  before_action :set_family, only: %i[ show edit update destroy ]

  # GET /familys or /familys.json
  def index
    @families = Family.all
  end

  # GET /familys/1 or /familys/1.json
  def show
    @families = Family.all

  end

  # GET /familys/new
  def new
    @family = Family.new
  end

  # GET /familys/1/edit
  def edit
  end

  # POST /familys or /familys.json
  def create
    @family = Family.new(family_params)
    respond_to do |format|
      if @family.save
        format.html { redirect_to family_url(@family), notice: "Family was successfully created." }
        format.json { render :show, status: :created, location: @family }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @family.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /familys/1 or /familys/1.json
  def update
    respond_to do |format|
      if @family.update(family_params)
        format.html { redirect_to family_url(@family), notice: "Family was successfully updated." }
        format.json { render :show, status: :ok, location: @family }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @family.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /familys/1 or /familys/1.json
  def destroy
    @family.destroy

    respond_to do |format|
      format.html { redirect_to families_url, notice: "Family was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_family
      @family = Family.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def family_params
      params.require(:family).permit(:name)
    end
end