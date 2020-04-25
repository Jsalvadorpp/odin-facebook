class CommentsController < ApplicationController

    def new
        current_user.comments.create(comment_params)
        flash['success'] = 'post commented'
        redirect_back(fallback_location:"/")
    end

    private def comment_params
        params.require('comment').permit(:content,:post_id)
    end
end
