class CreateChecks < ActiveRecord::Migration[6.1]
  def change
    create_table :checks do |t|
      t.references :user, null: false, foreign_key: true
      t.references :vaccination_record, null: false, foreign_key: true

      t.timestamps
    end
  end
end
