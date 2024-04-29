# frozen_string_literal: true

module Support
  class ChatPolicy < ApplicationPolicy
    def show?
      admin? || record.user == user
    end

    def send_message?
      show?
    end
  end
end
