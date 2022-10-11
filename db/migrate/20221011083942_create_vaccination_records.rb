class CreateVaccinationRecords < ActiveRecord::Migration[6.1]
  def change
    create_table :vaccination_records do |t|
      t.string :name
      t.string :count
      t.string :expected_date
      t.date :inplemented_date

      t.timestamps
    end
  end
end
