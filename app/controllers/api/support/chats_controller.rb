# frozen_string_literal: true

module Api
  module Support
    class ChatsController < ApiApplicationController
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

        messages = PaginationService.new(@chat.messages, 30).call(params[:page])
        @messages = messages.order(created_at: :desc).includes(:user)

        render json: MessageBlueprint.render(@messages)
      end

      def send_message
        authorize chat

        @message = @chat.messages.build(message_params)

        @message.save

        render json: MessageBlueprint.render(@message)
      end

      private

      def chat_params
        params.require(:chat).permit(:user_id, :title)
      end

      def message_params
        params.require(:message).permit(:user_id, :text)
      end

      def chat
        @chat ||= Chat.find(params[:id] || params[:chat_id])
      end
    end
  end
end
