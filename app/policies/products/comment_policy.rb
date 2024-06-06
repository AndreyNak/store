# frozen_string_literal: true

module Products
  class CommentPolicy < ApplicationPolicy
    def create?
      login?
    end

    def update?
      (!record.expired_update && my_comment?) || permissions.can_edit_comment_stranger?
    end

    def destroy?
      my_comment? || permissions.can_delete_comment_stranger?
    end

    def toggle_like?
      login?
    end

    private

    def my_comment?
      user.id == record.user.id
    end
  end
end
