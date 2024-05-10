# frozen_string_literal: true

class CartsController < ApplicationController
  before_action :authenticate_user!

  def show
    authorize Cart

    @cart_items = cart_items.includes(:product).order(:id)

    @total_price = @cart_items.total_price
  end

  def add_product
    authorize Cart

    product = Product.find(params[:product_id])
    cart = current_user.cart || current_user.create_cart
    cart_item = cart.cart_items.find_or_initialize_by(product:)
    cart_item.quantity += 1
    if cart_item.save
      redirect_to products_path(page: params[:page]), notice: 'Product added to cart.'
    else
      redirect_to product_path(product), alert: 'Unable to add product to cart.'
    end
  end

  def remove_product
    authorize Cart

    product = Product.find(params[:product_id])
    cart_item = cart_items.find_by(product:)
    if cart_item&.destroy
      redirect_to cart_path, notice: 'Product removed from cart.'
    else
      redirect_to cart_path, alert: 'Unable to remove product from cart.'
    end
  end

  def increment_quantity
    authorize Cart

    CartItemService.new(cart_items).increment_quantity(params[:product_id])

    redirect_to cart_path
  end

  def decrement_quantity
    authorize Cart

    @cart_item = CartItemService.new(cart_items).decrement_quantity(params[:product_id])

    @cart_item.destroy if @cart_item.quantity.zero?

    redirect_to cart_path
  end

  def checkout
    order = current_user.orders.build
    order_items_attributes = cart_items.map do |item|
      { product: item.product, quantity: item.quantity }
    end
    order.order_items.build(order_items_attributes)

    if order.save
      current_user.cart.destroy
      Order::ChangeStatusDeliverJob.perform_in(2.minutes, order.id)
      redirect_to root_path, notice: "Order created successfully"
    else
      redirect_to cart_path, alert: "Failed to create order"
    end
  end

  private

  def cart_items
    @cart_items ||= current_user.cart_items
  end
end
