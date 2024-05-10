# frozen_string_literal: true

class OrderPreparationService
  def initialize(orders)
    @orders = orders
  end

  def active_orders
    @orders = @orders.where(status: 'pending').or(@orders.where(status: 'delivering')).includes(order_items: :product)
  end
end
