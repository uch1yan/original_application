class CreateKids < ActiveRecord::Migration[6.1]
  def change
    create_table :kids do |t|
      t.string :kid_name
      t.date :date_of_birth
      t.text :avatar

      t.timestamps
    end
  end
end
