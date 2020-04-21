class FriendshipsController < ApplicationController

    def create
        user = User.find_by(id: params['user_id'])
        
        current_user.friendships.create(friend: user)
        user.friendships.create(friend: current_user)

        flash['success'] = "you are now friends with #{user.name} #{user.last_name}"
        redirect_to user_profile_path(user.id)
    end

    def destroy
        user = User.find_by(id: params['id'])
    
        remove_friend1 = Friendship.find_by(user_id: params['id'])
        remove_friend2 = Friendship.find_by(user_id: current_user.id)

        remove_friend1.destroy
        remove_friend2.destroy

        flash['warning'] = "you remove your friendship with #{user.name} #{user.last_name}"
        redirect_to user_profile_path(user.id)
    end
end
