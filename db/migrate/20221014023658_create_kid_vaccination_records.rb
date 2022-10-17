class CreateKidVaccinationRecords < ActiveRecord::Migration[6.1]
  def change
    create_table :kid_vaccination_records do |t|
      t.integer :count
      t.date :inplemented_date
      
      t.references :kid, null: false, foreign_key: true
      t.references :vaccination_record, null: false, foreign_key: true

      t.timestamps
    end
  end
end
