# frozen_string_literal: true

module Support
  class ChatPolicy < ApplicationPolicy
    def show?
      my_chat? || user.can_view_support_chats_stranger?
    end

    def create?
      login?
    end

    def send_message?
      my_chat? || user.can_edit_support_chat_stranger?
    end

    private

    def my_chat?
      record.user.id == user.id
    end
  end
end
