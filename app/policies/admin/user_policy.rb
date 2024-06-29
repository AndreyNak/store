# frozen_string_literal: true

module Admin
  class UserPolicy < ApplicationPolicy
    def index?
      user.can_view_admin_users?
    end

    def show?
      user.can_view_admin_user?
    end

    def update?
      user.can_edit_admin_user?
    end
  end
end
