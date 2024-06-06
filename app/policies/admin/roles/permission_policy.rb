# frozen_string_literal: true

module Admin
  module Roles
    class PermissionPolicy < ApplicationPolicy
      def index?
        permissions.can_view_admin_permissions?
      end

      def create?
        permissions.can_create_admin_permission?
      end

      def update?
        permissions.can_edit_admin_permission?
      end

      def destroy?
        permissions.can_delete_admin_permission?
      end
    end
  end
end
