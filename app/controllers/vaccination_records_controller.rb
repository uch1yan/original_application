class VaccinationRecordsController < ApplicationController

  def new
    @vaccine = VaccinationRecord.new
  end

  def create
    @vaccine = VaccinationRecord.new(vaccine_params)
    respond_to do |format|
      if @vaccine.save
        format.html { redirect_to vaccine_url(@vaccine), notice: "vaccine was successfully created." }
        format.json { render :show, status: :created, location: @vaccine }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @vaccine.errors, status: :unprocessable_entity }
      end
    end
  end


  private

  def vaccine_params
    params.require(:vaccination_record).permit(:name, :count, :expected_date, :inplemented_date)
  end
end
