class ChatChannel < ApplicationCable::Channel
  def subscribed
    chat = Chat.find(params[:id])
    stream_for chat
  end

  def unsubscribed
    Rails.logger.debug "Unsubscribed from chat_#{params[:chat_id]}"
  end
end
