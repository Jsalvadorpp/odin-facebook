module NotificationsHelper

    def request_sent(user)
        !user.notifications.where(from_user: current_user).empty?
    end

    def has_notifications?
        !current_user.notifications.where(checked: false).empty?
    end

    def notification_count
        current_user.notifications.count
    end
end
