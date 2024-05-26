# frozen_string_literal: true

class CartItem < ApplicationRecord
  belongs_to :cart
  belongs_to :product

  validates :quantity, numericality: { greater_than_or_equal_to: 0 }

  def self.total_price
    joins(:product).sum('COALESCE(products.discount_price, products.price) * cart_items.quantity')
  end
end
