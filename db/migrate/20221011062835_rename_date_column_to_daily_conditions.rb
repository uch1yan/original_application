class RenameDateColumnToDailyConditions < ActiveRecord::Migration[6.1]
  def change
    rename_column :daily_conditions, :date, :start_time
  end
end
