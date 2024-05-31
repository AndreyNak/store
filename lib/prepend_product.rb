# frozen_string_literal: true

class PrependProduct
  class << self
    def count_ordered(product, user, cart_items_product_ids)
      user.count_ordered_product(product.id) if user.cart && product?(product, user, cart_items_product_ids)
    end

    private

    def product?(product, user, cart_items_product_ids)
      user.product_in_cart?(product.id, cart_items_product_ids)
    end
  end
end
