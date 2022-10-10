class CreateGrowthRecords < ActiveRecord::Migration[6.1]
  def change
    create_table :growth_records do |t|
      t.date :date
      t.integer :height
      t.integer :weight
      t.references :kid, null: false, foreign_key: true

      t.timestamps
    end
  end
end
