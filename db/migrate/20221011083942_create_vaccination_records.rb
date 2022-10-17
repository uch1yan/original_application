class CreateVaccinationRecords < ActiveRecord::Migration[6.1]
  def change
    create_table :vaccination_records do |t|
      t.integer :name

      t.timestamps
    end
  end
end
