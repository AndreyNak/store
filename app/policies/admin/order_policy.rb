# frozen_string_literal: true

module Admin
  class OrderPolicy < ApplicationPolicy
    def index?
      user.can_view_admin_orders?
    end

    def live?
      user.can_view_admin_orders_live?
    end

    def statistics?
      user.can_view_admin_orders_statistics?
    end

    def states?
      user.can_view_admin_orders?
    end
  end
end
