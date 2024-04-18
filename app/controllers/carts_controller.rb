# frozen_string_literal: true

class CartsController < ApplicationController
  before_action :authenticate_user!

  def show
    authorize Cart

    cart = current_user.cart
    @cart_items = cart.cart_items.includes(:product)
    @total_price = @cart_items.joins(:product).sum('products.price * cart_items.quantity')
  end

  def add_product
    authorize Cart

    product = Product.find(params[:product_id])
    cart = current_user.cart || current_user.create_cart
    cart_item = cart.cart_items.find_or_initialize_by(product: product)
    cart_item.quantity += 1
    if cart_item.save
      redirect_to root_path, notice: 'Product added to cart.'
    else
      redirect_to product_path(product), alert: 'Unable to add product to cart.'
    end
  end

  def remove_product
    authorize Cart

    cart = current_user.cart
    product = Product.find(params[:product_id])
    cart_item = cart.cart_items.find_by(product: product)
    if cart_item&.destroy
      redirect_to cart_path, notice: 'Product removed from cart.'
    else
      redirect_to cart_path, alert: 'Unable to remove product from cart.'
    end
  end

  def increment_quantity
    authorize Cart

    @cart = current_user.cart
    @cart_item = @cart.cart_items.find_by(product_id: params[:product_id])
    @cart_item.quantity += 1
    @cart_item.save
    redirect_to cart_path
  end

  def decrement_quantity
    authorize Cart

    @cart = current_user.cart
    @cart_item = @cart.cart_items.find_by(product_id: params[:product_id])
    if @cart_item.quantity > 1
      @cart_item.quantity -= 1
      @cart_item.save
    else
      @cart_item.destroy
    end
    redirect_to cart_path
  end

  def checkout
    order = current_user.orders.build
    order_items_attributes = current_user.cart.cart_items.map do |item|
      { product: item.product, quantity: item.quantity }
    end
    order.order_items.build(order_items_attributes)


    if order.save
      current_user.cart.cart_items.destroy_all
      Order::ChangeStatusDeliverJob.perform_in(2.minutes, order.id)
      redirect_to root_path, notice: "Order created successfully"
    else
      redirect_to cart_path, alert: "Failed to create order"
    end
  end
end
