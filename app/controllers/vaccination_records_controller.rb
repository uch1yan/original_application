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

  def edit
    @vaccine = VaccinationRecord.find(params[:id])
    @check = current_user.checks.find_by(vaccination_record_id: @vaccine.id)
  end

  def update
    respond_to do |format|
      if @vaccine.update(vaccine_params)
        format.html { redirect_to vaccine_url(@vaccine), notice: "vaccine was successfully updated." }
        format.json { render :show, status: :ok, location: @vaccine }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @vaccine.errors, status: :unprocessable_entity }
      end
    end
  end



  def show
    @vaccine = VaccinationRecord.find(params[:id])
    @check = current_user.checks.find_by(vaccination_record_id: @vaccine.id)
  end


  private

  def vaccine_params
    params.require(:vaccination_record).permit(:name, :count, :expected_date, :inplemented_date)
  end
end