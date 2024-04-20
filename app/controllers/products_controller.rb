# frozen_string_literal: true

class ProductsController < ApplicationController
  def index
    if user_signed_in?
      orders = current_user && current_user.orders
      @total_price = current_user.cart_items.total_price
      @active_orders = orders.where(status: 'pending').or(orders.where(status: 'delivering'))
    end

    @products = ProductSearchService.new(products).call(params[:search])
  end

  def increment_quantity
    authorize Cart

    CartItemService.new(cart_items).increment_quantity(params[:product_id])

    redirect_to products_path
  end

  def decrement_quantity
    authorize Cart

    @cart_item = CartItemService.new(cart_items).decrement_quantity(params[:product_id])

    @cart_item.destroy if @cart_item.quantity.zero?

    redirect_to products_path
  end

  private

  def cart_items
    @cart_items = current_user.cart_items
  end

  def products
    @products ||= Product.with_attached_image.all
  end
end
