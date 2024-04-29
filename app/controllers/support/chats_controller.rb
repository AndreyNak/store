# frozen_string_literal: true

module Support
  class ChatsController < ApplicationController
    before_action :authenticate_user!

    def new
      @chat = Chat.new
    end

    def create
      @chat = Chat.new(chat_params)
      @chat.messages.build(user_id: chat_params[:user_id], text: chat_params[:title])

      if @chat.save
        redirect_to support_chat_path(@chat)
      else
        render :new, alert: 'Error'
      end
    end

    def show
      authorize chat

      messages = PaginationService.new(@chat.messages, 30).call(params[:page])
      @messages = messages.order(created_at: :desc).includes(:user)

      @message = Message.new
    end

    def send_message
      authorize chat

      @message = @chat.messages.build(message_params)

      @message.save

      MessagesStream.broadcast_append(@message, @chat, current_user)

      redirect_to support_chat_path(@chat)
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
