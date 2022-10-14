class DropKidVaccinesTable < ActiveRecord::Migration[6.1]
  def change
    drop_table :kid_vaccines
  end
end
