# frozen_string_literal: true

module Admin
  class RolePolicy < ApplicationPolicy
    def index?
      permissions.can_view_admin_roles?
    end

    def create?
      permissions.can_create_admin_role?
    end

    def update?
      permissions.can_edit_admin_role?
    end
  end
end
