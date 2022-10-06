class DailyConditionsController < ApplicationController
  def new
    @condition = DailyCondition.new
  end

  def edit
    @condition = DailyCondition.find(params[:id])
  end

  def show
    @condition = DailyCondition.find(params[:id])
  end

  private
    def daily_condition_params
      params.require(:daily_condition).permit(:date, :mood, :temperature, :sleep, :comment)
    end


end
