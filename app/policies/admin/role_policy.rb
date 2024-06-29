# frozen_string_literal: true

module Admin
  class RolePolicy < ApplicationPolicy
    def index?
      user.can_view_admin_roles?
    end

    def create?
      user.can_create_admin_role?
    end

    def update?
      user.can_edit_admin_role?
    end
  end
end
