# frozen_string_literal: true

module Admin
  module Roles
    class PermissionPolicy < ApplicationPolicy
      def index?
        user.can_view_admin_permissions?
      end

      def create?
        user.can_create_admin_permission?
      end

      def update?
        user.can_edit_admin_permission?
      end

      def destroy?
        user.can_delete_admin_permission?
      end
    end
  end
end
