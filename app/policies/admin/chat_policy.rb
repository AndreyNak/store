# frozen_string_literal: true

module Admin
  class ChatPolicy < ApplicationPolicy
    def index?
      user.can_view_admin_chats?
    end

    def show?
      user.can_view_admin_chat?
    end

    def send_message?
      user.can_edit_admin_chat?
    end
  end
end
