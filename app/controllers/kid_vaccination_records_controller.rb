class KidVaccinationRecordsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_kid, only: %i[ new create edit update ]
  before_action :no_access, only: [:edit]

  def index
    @kid_vaccination_records = KidVaccinationRecord.all
    @q = KidVaccinationRecord.ransack(params[:q])
    @kid_vaccination_records = @q.result.includes(:vaccination_record, :kid)
  end

  def new
    @kid_vaccination_record = KidVaccinationRecord.new
  end

  def create
    current_kid = Kid.find(kid_vaccination_record_params[:kid_id])
    kid_vaccination_record = current_kid.kid_vaccination_records.create!(vaccination_record_id: params[:kid_vaccination_record][:vaccination_record_id], inplemented_date: params[:kid_vaccination_record][:inplemented_date],count: params[:kid_vaccination_record][:count])
    #kid_vaccination_recordの変数はいらないかも
    redirect_to kid_vaccination_records_path, notice: "vaccine record was successfully created." 

  end

  def show
  end

  def edit
    @kid_vaccination_record = KidVaccinationRecord.find(params[:id])
  end

  def update
    @kid_vaccination_record = KidVaccinationRecord.find(params[:id])
    respond_to do |format|
      if @id_vaccination_record.update(kid_vaccination_params)
        format.html { redirect_to vaccination_records_url, notice: "vaccine record was successfully updated." }
        format.json { render :show, status: :ok, location: @kid_vaccination_record }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @kid_vaccination_record.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @kid_vaccination_record = KidVaccinationRecord.find(params[:id])
    @kid_vaccination_record.destroy
    respond_to do |format|
      format.html { redirect_to kid_vaccination_records_url, notice: "The record was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private

  def kid_vaccination_record_params
    params.require(:kid_vaccination_record).permit(:kid_id, :vaccination_record_id, :count, :inplemented_date)
  end

  def set_kid
    @kids = current_user.families.first.kids
    #アソシエーション要検討
  end

  def no_access
    @kid_vaccination_record = KidVaccinationRecord.find(params[:id])
    unless current_user.families.first.id == @kid_vaccination_record.kid.family.id
      redirect_to kid_vaccination_records_path, notice: "アクセス権限がありません" 
    end 
  end
end
