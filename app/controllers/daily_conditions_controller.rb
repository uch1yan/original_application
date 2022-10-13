class DailyConditionsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_kid, only: %i[ new create show edit update ]
  
  def index
    @conditions = DailyCondition.all
  end
  
  def new
    @condition = DailyCondition.new
  end

  def create
    # @condition = current_user.daily_conditions.build(daily_condition_params)
    @condition = DailyCondition.new(daily_condition_params)

    if @condition.save
      redirect_to daily_condition_path(@condition.id)
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
      redirect_to daily_condition_path(@condition.id)
      # flash[:info] = '情報を更新しました!'
    else
      render :edit
    end
  end

  def show
    @condition = DailyCondition.find(params[:id])
    @comments = @condition.comments
    @comment = @condition.comments.build
  end

  private
    def daily_condition_params
      params.require(:daily_condition).permit(:start_time, :mood, :temperature, :toilet, :sleep, :comment, :kid_id)
    end

    def set_kid
      @kids = current_user.families.first.kids
    end
end
