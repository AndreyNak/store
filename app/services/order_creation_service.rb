# frozen_string_literal: true

class OrderCreationService
  def initialize(user)
    @user = user
    @order = @user.orders.build
  end

  def call
    ActiveRecord::Base.transaction do
      build_order_items
      return unless @order.save

      cleanup_after_order
      create_job_change_status
      notify_admin_order
      publish_to_dashboard
    end

    @order
  rescue ActiveRecord::RecordInvalid => e
    { errors: e.message }
  end

  private

  def build_order_items
    cart_items = @user.cart_items.includes(product: [:type_products, :translations, { image_attachment: :blob }])

    check_cart_items_count(cart_items)

    order_items_attributes = cart_items.map do |item|
      product = item.product
      new_quantity = product.quantity - item.quantity

      ckeck_quantity_negative(new_quantity)

      product.update!(quantity: new_quantity)

      { product: item.product, quantity: item.quantity, price: calculate_price(item.product) }
    end

    @order.order_items.build(order_items_attributes)
  end

  def cleanup_after_order
    @user.cart.destroy
  end

  def calculate_price(product)
    product.discount_active? ? product.discount_price : product.price
  end

  def create_job_change_status
    OrderJobs::ChangeStatusDeliverJob.perform_in(rand(1..8).minutes, @order.id)
  end

  def notify_admin_order
    ActionCable.server.broadcast(
      'admin_orders',
      OrderBlueprint.render_as_hash(Order.with_total_amount.find(@order.id), view: :products)
    )
  end

  def publish_to_dashboard
    MessagePublisher.publish('orders', @order)
  end

  def check_cart_items_count(cart_items)
    return unless cart_items.count.zero?

    raise ActiveRecord::RecordInvalid.new(@order),
          'Order has no products for checkout. Please, refresh the page and take a product.'
  end

  def ckeck_quantity_negative(new_quantity)
    return unless new_quantity.negative?

    raise ActiveRecord::RecordInvalid.new(@order),
          "Insufficient stock for #{product.name}. Please, remove the product from your cart."
  end
end
