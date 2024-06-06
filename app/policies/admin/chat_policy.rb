# frozen_string_literal: true

module Admin
  class ChatPolicy < ApplicationPolicy
    def index?
      permissions.can_view_admin_chats?
    end

    def show?
      permissions.can_view_admin_chat?
    end

    def send_message?
      permissions.can_edit_admin_chat?
    end
  end
end
