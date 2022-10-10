class CreatePosts < ActiveRecord::Migration[6.1]
  def change
    create_table :posts do |t|
      t.datetime :date
      t.string :content

      t.timestamps
    end
  end
end
