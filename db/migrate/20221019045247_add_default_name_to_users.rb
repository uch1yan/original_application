class AddDefaultNameToUsers < ActiveRecord::Migration[6.1]
  def change
    change_column :users, :name, :string, :default => ''
  end
end
