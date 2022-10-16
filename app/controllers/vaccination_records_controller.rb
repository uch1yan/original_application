class VaccinationRecordsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_kid, only: %i[ new create edit update ]
  
  def index
    @vaccines = VaccinationRecord.all
    @q = VaccinationRecord.ransack(params[:q])
    @vaccines = @q.result(distinct: true)
  end

  def new
    @vaccine = VaccinationRecord.new
  end
  
  def create
    # @vaccine = current_user.families.first.kids.where(params[:kid_id]).vaccine_records.build(vaccine_params)
    @vaccine = VaccinationRecord.new(vaccine_params)
    respond_to do |format|
      if @vaccine.save
        format.html { redirect_to vaccination_record_path(@vaccine), notice: "vaccine was successfully created." }
        format.json { render :show, status: :created, location: @vaccine }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @vaccine.errors, status: :unprocessable_entity }
      end
    end
  end
  
  def show
    @vaccine = VaccinationRecord.find(params[:id])
  end

  def edit
    @vaccine = VaccinationRecord.find(params[:id])
  end

  def update
    @vaccine = VaccinationRecord.find(params[:id])
    respond_to do |format|
      if @vaccine.update(vaccine_params)
        format.html { redirect_to vaccination_records_url, notice: "vaccine was successfully updated." }
        format.json { render :show, status: :ok, location: @vaccine }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @vaccine.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @vaccine = VaccinationRecord.find(params[:id])
    @vaccine.destroy
    respond_to do |format|
      format.html { redirect_to vaccination_records_url, notice: "The record was successfully destroyed." }
      format.json { head :no_content }
    end
  end
  
  private

  def vaccine_params
    params.require(:vaccination_record).permit(:name, :count, :expected_date, :inplemented_date)
  end

  def set_kid
    @kids = current_user.families.first.kids
  end

end
