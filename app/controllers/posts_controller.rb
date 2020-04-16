class PostsController < ApplicationController

    def create
        @post = current_user.posts.new(post_params)

        if @post.save
            flash[:success] = 'Post created!'
            redirect_to home_path
        else
            flash[:success] = 'error'
            redirect_to home_path
        end
    end

    private def post_params
        params.require('post').permit(:textBody)
    end

end
