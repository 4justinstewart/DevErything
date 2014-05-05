class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|
      t.string  :title
      t.string  :url
      t.text    :content
      t.string  :author
      t.integer :user_id
      t.integer :category_id

      t.timestamps
    end
  end
end
