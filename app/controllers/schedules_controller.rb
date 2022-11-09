class SchedulesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_schedule, only: %i[ show edit update destroy ]
  before_action :set_kid, only: %i[ new create edit update ]
  before_action :no_access, only: %i[ edit show ]
  before_action :no_family
  before_action :no_kids_no_family

  def index
    @schedules = Schedule.all
  end

  # GET /schedules/1 or /schedules/1.json
  def show
  end

  # GET /schedules/new
  def new
    @schedule = Schedule.new
  end

  # GET /schedules/1/edit
  def edit
  end

  # POST /schedules or /schedules.json
  def create
    @schedule = Schedule.new(schedule_params)

    respond_to do |format|
      if @schedule.save
        format.html { redirect_to schedules_url, notice: t('notice.create_schedules') }
        format.json { render :show, status: :created, location: @schedule }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @schedule.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /schedules/1 or /schedules/1.json
  def update
    respond_to do |format|
      if @schedule.update(schedule_params)
        format.html { redirect_to schedule_url(@schedule), notice: t('notice.update_schedules') }
        format.json { render :show, status: :ok, location: @schedule }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @schedule.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /schedules/1 or /schedules/1.json
  def destroy
    @schedule.destroy

    respond_to do |format|
      format.html { redirect_to schedules_url, notice: t('notice.delete_schedules') }
      format.json { head :no_content }
    end
  end

  private

    
  def set_schedule
    @schedule = Schedule.find(params[:id])
  end

  def set_kid
    @kids = current_user.families.first.kids
  end

  def schedule_params
    params.require(:schedule).permit(:title, :content, :start_time, :kid_id)
  end

  def no_access
    @schedule = Schedule.find(params[:id])
    unless current_user.families.first.id == @schedule.kid.family.id
      redirect_to schedules_path, notice: t('notice.no_access')
    end 
  end

  def no_family
    unless current_user.families.first.present?
      redirect_to new_family_path, notice: "はじめに家族名を登録してください"
    end
  end

  def no_kids_no_family
    unless current_user.families || current_user.families.first.kids.length > 0
      redirect_to user_path(current_user), notice: "家族名／マイキッズの登録をしてください"
    end
  end
end
