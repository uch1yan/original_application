class CreateDailyConditions < ActiveRecord::Migration[6.1]
  def change
    create_table :daily_conditions do |t|
      t.datetime :date, null: false
      t.integer :mood, null: false
      t.string  :temperature
      t.integer :toilet, null: false
      t.string :sleep, null: false
      t.text  :comment, null: false
      t.timestamps
    end
  end
end
