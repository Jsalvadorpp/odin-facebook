class PagesController < ApplicationController

    def home
        @user = current_user

        if @user
            user_friendships = "SELECT friend_id FROM friendships WHERE user_id = #{@user.id} "
            @feed_posts = Post.where("creator_id IN (#{user_friendships}) OR creator_id = ?",@user.id)
            
            @post = Post.new
        end

    end
end
