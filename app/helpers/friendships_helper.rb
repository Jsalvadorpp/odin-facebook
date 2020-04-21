module FriendshipsHelper

    def can_be_friends(user)
        not_friend = current_user.friendships.where(friend_id: user.id).empty?
        (current_user != user && not_friend)? true:false  
    end

    def already_friends(user)
        !current_user.friendships.where(friend_id: user.id).empty?
    end
end
