# frozen_string_literal: true

class OrderCreationService
  def initialize(user)
    @user = user
    @order = @user.orders.build
  end

  def call
    build_order_items
    return unless @order.save

    cleanup_after_order
    create_job

    @order
  end

  private

  def build_order_items
    order_items_attributes = @user.cart_items.includes(:product).map do |item|
      { product: item.product, quantity: item.quantity, price: calculate_price(item.product) }
    end

    @order.order_items.build(order_items_attributes)
  end

  def cleanup_after_order
    @user.cart.destroy
  end

  def calculate_price(product)
    product.discount_price || product.price
  end

  def create_job
    Order::ChangeStatusDeliverJob.perform_in(2.minutes, @order.id)
  end
end
