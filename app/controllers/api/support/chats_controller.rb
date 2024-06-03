# frozen_string_literal: true

module Api
  module Support
    class ChatsController < ApiApplicationController
      MAX_ITEMS_ON_PAGE = 30

      before_action :authenticate_user!

      def create
        @chat = Chat.new(chat_params)
        @chat.messages.build(user_id: chat_params[:user_id], text: chat_params[:title])

        if @chat.save
          render json: CartBlueprint.render(@chat)
        else
          render json: { errors: @chat.errors.full_messages }
        end
      end

      def show
        authorize chat

        @messages = paginate_messages.order(created_at: :desc).includes(:user)

        render json: {
          chat: ChatBlueprint.render_as_json(chat),
          messages: MessageBlueprint.render_as_json(@messages, view: :support),
          meta: { paginate: { page: params[:page] || 1 } }
        }
      end

      def send_message
        authorize chat

        @message = chat.messages.build(message_params)
        @message.save

        ChatChannel.broadcast_to(chat, MessageBlueprint.render_as_hash(@message))

        render json: {}, status: :ok
      end

      private

      def chat_params
        params.require(:chat).permit(:user_id, :title)
      end

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
