# frozen_string_literal: true

module Products
  class CommentPolicy < ApplicationPolicy
    def create?
      login?
    end

    def update?
      (!record.expired_update && user.id == record.user.id) || user.admin?
    end

    def destroy?
      user.id == record.user.id || user.admin?
    end

    def toggle_like?
      login?
    end
  end
end
