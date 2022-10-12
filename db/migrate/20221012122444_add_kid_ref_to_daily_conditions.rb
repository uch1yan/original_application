class AddKidRefToDailyConditions < ActiveRecord::Migration[6.1]
  def change
    add_reference :daily_conditions, :kid, foreign_key: true
  end
end
