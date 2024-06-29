# frozen_string_literal: true

module Admin
  class TypeProductPolicy < ApplicationPolicy
    def index?
      user.can_view_admin_type_products?
    end

    def update?
      user.can_edit_admin_type_product?
    end

    def destroy?
      user.can_delete_admin_type_product?
    end

    def create?
      user.can_create_admin_type_product?
    end
  end
end
