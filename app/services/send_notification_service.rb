# frozen_string_literal: true

class SendNotificationService
  attr_reader :notifiable

  def initialize(notifiable)
    @notifiable = notifiable
  end

  def call(message)
    notification = Notification.create(user: notifiable.user, notifiable:, message:)
    ActionCable.server.broadcast(
      "notifications_#{notifiable.user.id}",
      NotificationBlueprint.render_as_hash(notification)
    )
  end
end
