class PostsController < ApplicationController
    before_action :is_logged?

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

    def add_like
        @post = Post.find_by(id: params['post_id'])
        Like.create(liked_post: @post,user: current_user)

        respond_to do |f|
            f.js {render action: 'update_likes'}
        end
    end

    def remove_like
        @post = Post.find_by(id: params['post_id'])

        like = @post.likes.find_by(user_id: current_user)
        like.destroy
        
        respond_to do |f|
            f.js {render action: 'update_likes'}
        end
    end

    private def post_params
        params.require('post').permit(:textBody)
    end

end
