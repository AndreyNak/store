# frozen_string_literal: true

module Api
  module Admin
    class ChatsController < BaseController
      MAX_ITEMS_ON_PAGE = 30

      def index
        authorize Chat

        @chats = Chat.all.includes(user: :role).order(created_at: :desc)

        render json: ChatBlueprint.render(@chats)
      end

      def show
        authorize Chat

        @messages = paginate_messages.order(created_at: :desc).includes(:user)

        render json: {
          chat: ChatBlueprint.render_as_json(chat),
          messages: MessageBlueprint.render_as_json(@messages),
          meta: { paginate: { page: params[:page] || 1 } }
        }
      end

      def send_message
        authorize Chat

        @message = chat.messages.build(message_params)
        @message.save

        ChatChannel.broadcast_to(chat, MessageBlueprint.render_as_hash(@message))

        render json: {}, status: :ok
      end

      private

      def message_params
        params.require(:message).permit(:user_id, :text)
      end

      def paginate_messages
        @paginate_messages ||= PaginationService.new(chat.messages, MAX_ITEMS_ON_PAGE).infinite_scroll(params[:page])
      end

      def chat
        @chat ||= Chat.find(params[:id] || params[:chat_id])
      end
    end
  end
end
