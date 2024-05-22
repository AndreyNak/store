# frozen_string_literal: true

module Api
  class CartsController < ApiApplicationController
    before_action :authenticate_user!

    def show
      authorize Cart

      @cart_items = cart_items.includes(:product).order(:id)

      @total_price = @cart_items.total_price

      render json: CartItemBlueprint.render(@cart_items, root: :cartItems, meta: { totalPrice: @total_price.to_i })
    end

    def add_product
      authorize Cart

      product = Product.find(params[:product_id])
      cart = current_user.cart || current_user.create_cart
      cart_item = cart.cart_items.find_or_initialize_by(product:)
      cart_item.quantity += 1
      if cart_item.save
        redirect_to api_current_user_path
      else
        render json: { errors: 'Unable to add product to cart.' }
      end
    end

    def remove_product
      authorize Cart

      product = Product.find(params[:product_id])
      cart_item = cart_items.find_by(product:)
      if cart_item&.destroy
        render json: { notice: 'Product removed from cart.' }, status: :ok
      else
        render json: { error: 'Unable to remove product from cart.' }, status: :internal_server_error
      end
    end

    def increment_quantity
      authorize Cart

      CartItemService.new(cart_items).increment_quantity(params[:product_id])

      render json: {}, status: :ok
    end

    def decrement_quantity
      authorize Cart

      @cart_item = CartItemService.new(cart_items).decrement_quantity(params[:product_id])

      @cart_item.destroy if @cart_item.quantity.zero?

      render json: {}, status: :ok
    end

    def checkout
      order = current_user.orders.build
      order_items_attributes = cart_items.includes(:product).map do |item|
        { product: item.product, quantity: item.quantity }
      end
      order.order_items.build(order_items_attributes)

      if order.save
        current_user.cart.destroy
        Order::ChangeStatusDeliverJob.perform_in(2.minutes, order.id)
        redirect_to api_current_user_path
      else
        render json: { errors: 'Failed to create order' }
      end
    end

    private

    def cart_items
      @cart_items ||= current_user.cart_items
    end
  end
end
