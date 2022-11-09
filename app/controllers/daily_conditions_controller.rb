class DailyConditionsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_kid, only: %i[ new create show edit update ]
  before_action :no_access, only: %i[ edit show ]
  before_action :no_family
  before_action :no_kids_no_family
  
  def index
    @conditions = DailyCondition.all
  end
  
  def new
    @condition = DailyCondition.new
  end

  def create
    @condition = DailyCondition.new(daily_condition_params)
    if @condition.save
      redirect_to daily_conditions_path, notice: t('notice.create_records')
    else
      render :new
    end
  end

  def edit
    @condition = DailyCondition.find(params[:id])
  end

  def update
    @condition = DailyCondition.find(params[:id])
    if @condition.update(daily_condition_params)
      redirect_to daily_conditions_path, notice: t('notice.update_records')
    else
      render :edit
    end
  end

  def show
    @condition = DailyCondition.find(params[:id])
    @comments = @condition.comments
    @comment = @condition.comments.build
  end

  def destroy
    @condition = DailyCondition.find(params[:id])
    @condition.destroy
    respond_to do |format|
      format.html { redirect_to daily_conditions_url, notice: t('notice.delete_records')}
      format.json { head :no_content }
    end
  end


  private
  def daily_condition_params
    params.require(:daily_condition).permit(:start_time, :mood, :temperature, :toilet, :sleep, :comment, :kid_id)
  end

  def set_kid
    @kids = current_user.families.first.kids
  end

  def no_access
    @condition = DailyCondition.find(params[:id])
    unless current_user.families.first.id == @condition.kid.family.id
      redirect_to daily_conditions_path, notice: t('notice.no_access') 
    end 
  end

  def no_family
    unless current_user.families.first.present?
      redirect_to new_family_path, notice: "はじめに家族名を登録してください"
    end
  end

  def no_kids_no_family
    unless current_user.families && current_user.families.first.kids.length > 0
      redirect_to user_path(current_user), notice: "家族名／マイキッズの登録をしてください"
    end
  end
end

