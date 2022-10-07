class DailyConditionsController < ApplicationController
  def new
    @condition = DailyCondition.new
  end

  def create
    @condition = current_user.daily_conditions.build(daily_condition_params)
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
      params.require(:daily_condition).permit(:date, :mood, :temperature, :toilet, :sleep, :comment)
    end


end
