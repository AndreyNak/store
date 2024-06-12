
module Api
  class NotificationsController < ApiApplicationController
    before_action :authenticate_user!

    def index
      notifications = current_user.notifications.where(read: false).order(created_at: :desc)

      render json: NotificationBlueprint.render(notifications)
    end

    def mark_as_read
      notification = Notification.find(params[:id])
      notification.update(read: true)

      render json: NotificationBlueprint.render(notification)
    end
  end
end
