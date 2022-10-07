class CreateSchedules < ActiveRecord::Migration[6.1]
  def change
    create_table :schedules do |t|
      t.string :title
      t.text :content
      t.datetime :date
      t.references :kid, null: false, foreign_key: true

      t.timestamps
    end
  end
end
