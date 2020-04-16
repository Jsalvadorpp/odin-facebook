class AddReferencesToPosts < ActiveRecord::Migration[6.0]
  def change
    add_reference :posts, :creator, references: :users
    add_foreign_key :posts, :users, column: :creator_id
  end
end
