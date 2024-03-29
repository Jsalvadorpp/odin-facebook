class UserController < ApplicationController
    before_action :is_logged?

    def show
        @user = User.find_by(id: params['id'])

        user_friendships = "SELECT friend_id FROM friendships WHERE user_id = #{@user.id} "
        @feed_posts = Post.where("creator_id IN (#{user_friendships}) OR creator_id = ?",@user.id)

        @post = Post.new 
    end

    def search
        if params['search'].present?

            query = params['search']
            @users = User.where("lower(concat(name,' ',last_name)) like ?","%#{query.downcase}%")
                .or( User.where("lower(name) like ?", "%#{query.downcase}%") )
                .or( User.where("lower(last_name) like ?", "%#{query.downcase}%") )
                                      
        else
            @users = User.all
        end
    end

    def friends_list
        @profile = User.find_by(id: params['id'])

        friendships = @profile.friendships
        @users = friendships.map{|friendship| friendship.friend}

        render 'user/search'
    end

end
