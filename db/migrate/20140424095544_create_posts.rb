class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|
      t.string  :title
      t.string  :url
      t.text    :content
      t.integer :user_id
      t.integer :category_id
      t.integer :vote_count, default: 0

      t.timestamps
    end
  end
end
