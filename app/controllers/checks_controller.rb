class ChecksController < ApplicationController
  def create
    check = current_user.checks.create(vaccination_record_id: params[:vaccination_record_id])
    # redirect_to edit_vaccination_record_path(@vaccine.id)
  end

  def destroy
    check = current_user.checks.find_by(id: params[:id]).destroy
    # redirect_to edit_vaccination_record_path(@vaccine.id)
  end
end
