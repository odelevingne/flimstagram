class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|
      t.string :description
      t.integer :user_id
      t.text :path

      t.timestamps
    end
  end
end
