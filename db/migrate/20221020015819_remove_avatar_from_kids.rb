class RemoveAvatarFromKids < ActiveRecord::Migration[6.1]
  def change
    remove_column :kids, :avatar
  end
end
