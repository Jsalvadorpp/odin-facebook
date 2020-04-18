class AddReferencesToFriendship < ActiveRecord::Migration[6.0]
  def change
    add_reference :friendships , :user , foreign_key: true

    add_reference :friendships , :friend , references: :users
    add_foreign_key :friendships , :users , column: :friend_id
  end
end
