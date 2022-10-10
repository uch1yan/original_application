class RenameDateColumnToSchedules < ActiveRecord::Migration[6.1]
  def change
    rename_column :schedules, :date, :start_time
  end
end
