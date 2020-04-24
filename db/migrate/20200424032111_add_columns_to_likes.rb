class AddColumnsToLikes < ActiveRecord::Migration[6.0]
  def change
    add_reference :likes , :user , foreign_key: true

    add_reference :likes , :liked_post , references: :posts
    add_foreign_key :likes , :posts, column: :liked_post_id
  end
end
