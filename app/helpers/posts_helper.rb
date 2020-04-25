module PostsHelper

    def post_liked(post_id)
        !Like.where(liked_post_id: post_id,user: current_user).empty?
    end
end
