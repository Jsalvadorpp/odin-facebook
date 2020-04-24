class Post < ApplicationRecord
    belongs_to :creator, class_name: :User , foreign_key: :creator_id
    has_many :likes , foreign_key: :liked_post_id
    
    default_scope { order("created_at DESC") }
end
