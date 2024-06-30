# frozen_string_literal: true

module Api
  class CartsController < ApiApplicationController
    before_action :authenticate_user!

    def show
      authorize Cart

      @total_price = cart_items.total_price
      @cart_items = cart_items.includes(product: %i[translations type_products]).order(:id)

      render json: CartItemBlueprint.render(@cart_items, root: :cartItems, meta: { totalPrice: @total_price.to_i })
    end

    def add_product
      authorize Cart

      CartItemService.new(nil).add_product(params[:product_id], current_user)

      redirect_to api_current_user_path
    end

    def remove_product
      authorize Cart

      product = Product.find(params[:product_id])
      cart_item = cart_items.find_by(product:)

      cart_item&.destroy

      render json: {}, status: :ok
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
      authorize Cart

      result = OrderCreationService.new(current_user).call

      if result.is_a?(Order)
        redirect_to api_current_user_path
      else
        render json: result.to_json, status: :unprocessable_entity
      end
    end

    private

    def cart_items
      @cart_items ||= current_user.cart_items
    end
  end
end
