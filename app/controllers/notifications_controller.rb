class NotificationsController < ApplicationController
    before_action :is_logged?

    def show
        @notifications = current_user.notifications
        @notifications.update_all(checked: true)
    end

    def create
        user = User.find_by(id: params['user_id'])

        Notification.create(from_user: current_user, to_user: user)
        flash['success'] = "Friendship request sent to #{user.name} #{user.last_name}"
        redirect_back(fallback_location:"/")
    end

    def destroy
        user = User.find_by(id: params['user_id'])
        notification = Notification.find_by(from_user: user , to_user: current_user)

        notification.destroy

        redirect_to user_notifications_path
    end
end
