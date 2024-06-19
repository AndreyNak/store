# frozen_string_literal: true

module Admin
  class OrderPolicy < ApplicationPolicy
    def index?
      permissions.can_view_admin_orders?
    end

    def live?
      permissions.can_view_admin_orders_live?
    end

    def statistics?
      permissions.can_view_admin_orders_statistics?
    end

    def states?
      permissions.can_view_admin_orders?
    end
  end
end
