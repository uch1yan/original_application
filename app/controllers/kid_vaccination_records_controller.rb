class KidVaccinationRecordsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_kid, only: %i[ new create edit update ]

  def index
    @kid_vaccination_records = KidVaccinationRecord.all
    @q = KidVaccinationRecord.ransack(params[:q])
    @kid_vaccination_records = @q.result(distinct: true)
  end

  def new
    @kid_vaccination_record = KidVaccinationRecord.new
  end

  def create
    current_kid = Kid.find(kid_vaccination_record_params[:kid_id])
    kid_vaccination_record = current_kid.kid_vaccination_records.create!(vaccination_record_id: params[:kid_vaccination_record][:vaccination_record_id], inplemented_date: params[:kid_vaccination_record][:inplemented_date],count: params[:kid_vaccination_record][:count])
    #kid_vaccination_recordの変数はいらないかも
    redirect_to kid_vaccination_records_path, notice: "vaccine was successfully created." 

  end

  def edit
  end

  def update
  end

  private

  def kid_vaccination_record_params
    params.require(:kid_vaccination_record).permit(:kid_id, :vaccination_record_id, :count, :inplemented_date)
  end

  def set_kid
    @kids = current_user.families.first.kids
    #アソシエーション要検討
  end
end
