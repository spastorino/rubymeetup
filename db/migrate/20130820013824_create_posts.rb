class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|
      t.string :title
      t.string :description
      t.integer :priority
      t.string :category
      t.integer :user_id
      t.integer :like_count
      t.boolean :featured, :default => false

      t.timestamps
    end
  end
end
