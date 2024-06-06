# frozen_string_literal: true

module Admin
  class UserPolicy < ApplicationPolicy
    def index?
      permissions.can_view_admin_users?
    end

    def show?
      permissions.can_view_admin_user?
    end

    def update?
      permissions.can_edit_admin_user?
    end
  end
end
