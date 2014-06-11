class CreateAddindices < ActiveRecord::Migration
  def change
    add_index :votes, :user_id
    add_index :votes, [:post_id, :user_id]

    add_index :favorites, :user_id
    add_index :favorites, [:post_id, :user_id]

    add_index :taggings, :post_id
    add_index :taggings, :tag_id

    add_index :posts, :user_id
    add_index :posts, [:category_id, :user_id]
  end
end
