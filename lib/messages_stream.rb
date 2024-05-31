# frozen_string_literal: true

class MessagesStream
  def self.broadcast_append(message, chat, current_user)
    message.broadcast_append_to chat, partial: 'messages/shared/message', locals: { current_user_id: current_user.id }
  end
end
