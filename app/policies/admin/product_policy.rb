# frozen_string_literal: true

module Admin
  class ProductPolicy < ApplicationPolicy
    def index?
      permissions.can_view_admin_products?
    end

    def create?
      permissions.can_create_admin_product?
    end

    def update?
      permissions.can_edit_admin_product?
    end

    def destroy?
      permissions.can_delete_admin_product?
    end

    def make_discount?
      permissions.can_edit_admin_product_make_discount?
    end
  end
end
