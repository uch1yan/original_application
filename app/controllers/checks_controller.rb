class ChecksController < ApplicationController
  before_action :find_vaccination_record, only: %i[create destroy]

  def create
    @check = current_user.checks.create(vaccination_record_id: params[:vaccination_record_id])
  end

  def destroy
    current_user.checks.find_by(id: params[:id]).destroy
  end

  private

  def find_vaccination_record
    @vaccine = VaccinationRecord.find(params[:vaccination_record_id])
  end
end

