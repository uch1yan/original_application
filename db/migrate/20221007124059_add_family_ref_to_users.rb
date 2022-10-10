class AddFamilyRefToUsers < ActiveRecord::Migration[6.1]
  def change
    add_reference :users, :family, foreign_key: true
  end
end
