# frozen_string_literal: true

module Admin
  class ProductPolicy < ApplicationPolicy
    def index?
      user.can_view_admin_products?
    end

    def create?
      user.can_create_admin_product?
    end

    def update?
      user.can_edit_admin_product?
    end

    def destroy?
      user.can_delete_admin_product?
    end

    def make_discount?
      user.can_edit_admin_product_make_discount?
    end
  end
end
