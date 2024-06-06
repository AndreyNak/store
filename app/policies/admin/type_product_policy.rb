# frozen_string_literal: true

module Admin
  class TypeProductPolicy < ApplicationPolicy
    def index?
      permissions.can_view_admin_type_products?
    end

    def update?
      permissions.can_edit_admin_type_product?
    end

    def destroy?
      permissions.can_delete_admin_type_product?
    end

    def create?
      permissions.can_create_admin_type_product?
    end
  end
end
