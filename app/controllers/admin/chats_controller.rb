# frozen_string_literal: true

module Admin
  class ChatsController < Admin::BaseController
    def index
      @chats = Chat.all.includes(:user)
    end

    def show
      @chat = Chat.find(params[:id])
      messages = PaginationService.new(@chat.messages, 30).call(params[:page])
      @messages = messages.order(created_at: :desc).includes(:user)

      @message = Message.new
    end

    def send_message
      @chat = Chat.find(params[:chat_id])

      @message = @chat.messages.build(message_params)
      @message.save

      MessagesStream.broadcast_append(@message, @chat, current_user)

      redirect_to admin_chat_path(@chat)
    end

    private

    def message_params
      params.require(:message).permit(:user_id, :text)
    end
  end
end
