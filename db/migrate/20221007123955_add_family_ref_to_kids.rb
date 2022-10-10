class AddFamilyRefToKids < ActiveRecord::Migration[6.1]
  def change
    add_reference :kids, :family, foreign_key: true
  end
end
