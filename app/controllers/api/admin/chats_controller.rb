# frozen_string_literal: true

module Api
  module Admin
    class ChatsController < Admin::BaseController
      MAX_ITEMS_ON_PAGE = 30
      def index
        @chats = Chat.all.includes(:user)

        render json: ChatBlueprint.render(@chats)
      end

      def show
        @chat = Chat.find(params[:id])
        messages = @chat.messages

        messages = PaginationService.new(messages, MAX_ITEMS_ON_PAGE).infinite_scroll(params[:page])
        @messages = messages.order(created_at: :desc).includes(:user)

        render json: {
          chat: ChatBlueprint.render_as_json(@chat),
          messages: MessageBlueprint.render_as_json(@messages),
          meta: { paginate: { page: params[:page] || 1 } }
        }
      end

      def send_message
        @chat = Chat.find(params[:chat_id])

        @message = @chat.messages.build(message_params)
        @message.save

        ChatChannel.broadcast_to(@chat, MessageBlueprint.render_as_hash(@message))

        render json: MessageBlueprint.render(@message)
      end

      private

      def message_params
        params.require(:message).permit(:user_id, :text)
      end
    end
  end
end
