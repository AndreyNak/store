# frozen_string_literal: true

class ProductsController < ApplicationController
  def index
    if user_signed_in?
      orders = current_user && current_user.orders
      @total_price = current_user.cart_items.total_price
      @active_orders = orders.where(status: 'pending').or(orders.where(status: 'delivering')).includes(order_items: :product)
    end

    @type_products = TypeProduct.all
    @products = ProductSearchService.new(products).call(params, current_user).includes(:favorites)
    @products = PaginationService.new(@products, 18).call(params[:page])
  end

  def increment_quantity
    authorize Cart

    @cart_item = CartItemService.new(cart_items).increment_quantity(params[:product_id])

    redirect_to products_path(page: params[:page])
  end

  def decrement_quantity
    authorize Cart

    @cart_item = CartItemService.new(cart_items).decrement_quantity(params[:product_id])

    @cart_item.destroy if @cart_item.quantity.zero?

    redirect_to products_path(page: params[:page])
  end

  def toggle_favorite
    authorize Cart
    product = products.find(params[:id])
    if current_user.favorites.exists?(product_id: product.id)
      current_user.favorites.find_by(product_id: product.id).destroy
    else
      current_user.favorites.create(product_id: product.id)
    end
    redirect_to products_path(page: params[:page]), notice: "Product #{current_user.favorites.exists?(product_id: product.id) ? 'added to' : 'removed from'} favorites"
  end

  private

  def cart_items
    @cart_items = current_user.cart_items
  end

  def products
    @products ||= Product.with_attached_image.all
  end
end
