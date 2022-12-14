class GrowthRecordsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_growth_record, only: %i[ edit update destroy ]
  before_action :set_kid, only: %i[ new create edit update ]
  before_action :no_access, only: %i[ edit ]
  before_action :no_family
  before_action :no_kid

  # GET /growth_records or /growth_records.json
  def index
    @growth_records = GrowthRecord.all
    @growth_data = GrowthRecord.all
    @kids = current_user.families.first.kids
  end

  # GET /growth_records/1 or /growth_records/1.json
  def show
    @kids = current_user.families.first.kids
    @growth_records = []
    @kids.each do |kid|
      kid.growth_records.each do |growth_record|
        @growth_records << growth_record
      end
    end
  end

  # GET /growth_records/new
  def new
    @growth_record = GrowthRecord.new
  end

  # GET /growth_records/1/edit
  def edit
  end

  # POST /growth_records or /growth_records.json
  def create
    @growth_record = GrowthRecord.new(growth_record_params)

    respond_to do |format|
      if @growth_record.save
        format.html { redirect_to growth_records_url, notice: t('notice.create_growth') }
        format.json { render :show, status: :created, location: @growth_record }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @growth_record.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /growth_records/1 or /growth_records/1.json
  def update
    respond_to do |format|
      if @growth_record.update(growth_record_params)
        format.html { redirect_to growth_record_url(@growth_record), notice: t('notice.update_growth') }
        format.json { render :show, status: :ok, location: @growth_record }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @growth_record.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /growth_records/1 or /growth_records/1.json
  def destroy
    @growth_record.destroy
    respond_to do |format|
      format.html { redirect_to growth_records_url, notice: t('notice.delete_growth') }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_growth_record
      @growth_record = GrowthRecord.find(params[:id])
    end

    def set_kid
      @kids = current_user.families.first.kids
    end


    # Only allow a list of trusted parameters through.
    def growth_record_params
      params.require(:growth_record).permit(:date, :height, :weight, :kid_id)
    end

    def no_access
      @growth_record = GrowthRecord.find(params[:id])
      unless current_user.families.first.id == @growth_record.kid.family.id
        redirect_to growth_records_path, notice: t('notice.no_access')
      end 
    end

    def no_family
      unless current_user.families.first.present?
        redirect_to new_family_path, notice: "????????????????????????????????????????????????"
      end
    end

    def no_kid
      unless current_user.families.first.kids.length > 0
        redirect_to user_path(current_user), notice: "?????????????????????????????????????????????"
      end
    end
end
