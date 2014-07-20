class CreateAddindices < ActiveRecord::Migration
  def change
    add_index :posts, [:category_id, :user_id]
    add_index :posts, :user_id
  end
end
