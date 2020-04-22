class AddReferencesToNotifications < ActiveRecord::Migration[6.0]
  def change
    add_reference :notifications , :from_user, references: :users
    add_foreign_key :notifications , :users , column: :from_user_id

    add_reference :notifications , :to_user, references: :users
    add_foreign_key :notifications , :users , column: :to_user_id

    add_column :notifications , :checked , :bool, default: false
  end
end
