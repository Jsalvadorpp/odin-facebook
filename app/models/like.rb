class Like < ApplicationRecord
    belongs_to :user
    belongs_to :liked_post , class_name: :Post , foreign_key: :liked_post_id
end
