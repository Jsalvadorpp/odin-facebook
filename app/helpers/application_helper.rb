module ApplicationHelper

    def user_is_permitted?
        (user_signed_in? && current_user == @user)? true:false
    end

end
