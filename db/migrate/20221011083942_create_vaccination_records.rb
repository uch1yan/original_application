class CreateVaccinationRecords < ActiveRecord::Migration[6.1]
  def change
    create_table :vaccination_records do |t|
      t.integer :name
      t.integer :count
      t.string :expected_date
      t.date :inplemented_date

      t.timestamps
    end
  end
end
