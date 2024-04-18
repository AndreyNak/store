# frozen_string_literal: true

class ProductsController < ApplicationController
  def index
    orders = current_user.orders

    @products = Product.all
    @active_orders = orders.where(status: 'pending').or(orders.where(status: 'delivering'))
  end
end
