# frozen_string_literal: true

module Products
  class CommentPolicy < ApplicationPolicy
    def create?
      login? && user.can_create_comment?
    end

    def update?
      (!record.expired_update? && my_comment?) || user.can_edit_comment_stranger?
    end

    def destroy?
      my_comment? || user.can_delete_comment_stranger?
    end

    def toggle_like?
      login?
    end

    def disable_commiserate?
      user.can_edit_comment_user_disable_commiserate?
    end

    private

    def my_comment?
      user.id == record.user.id
    end
  end
end
