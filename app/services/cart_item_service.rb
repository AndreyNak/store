# frozen_string_literal: true

class CartItemService
  def initialize(cart_items)
    @cart_items = cart_items
  end

  def increment_quantity(product_id)
    @cart_item = @cart_items.find_by(product_id:)
    @cart_item.quantity += 1
    @cart_item.save

    @cart_item
  end

  def decrement_quantity(product_id)
    @cart_item = @cart_items.find_by(product_id:)
    @cart_item.quantity -= 1
    @cart_item.save

    @cart_item
  end

  def add_product(product_id, user)
    product = Product.find(product_id)
    cart = user.cart || user.create_cart
    cart_item = cart.cart_items.find_or_initialize_by(product:)
    cart_item.quantity += 1
    cart_item.save
    cart_item
  end
end
