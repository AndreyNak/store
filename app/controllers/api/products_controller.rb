# frozen_string_literal: true

module Api
  class ProductsController < ApiApplicationController
    MAX_ITEMS_ON_PAGE = 18

    def index
      @products = ProductSearchService.new(products).call(params, current_user)

      render json: {
        typeProducts: TypeProductBlueprint.render_as_json(TypeProduct.all.includes(:translations), view: :products),
        products: ProductBlueprint.render_as_json(
          sorted_products(products_paginate.pagin(params[:page])).includes(:type_products, :translations),
          view: current_user ? :base : :guest,
          root: :products,
          user: current_user,
          **authorized_products
        ),
        meta: { paginate: { page: params[:page] || 1, maxPage: products_paginate.max_page } }
      }
    end

    def show
      @product = Product.find(params[:id])

      render json: ProductBlueprint.render(@product, view: :show)
    end

    def increment_quantity
      authorize Cart

      @cart_item = CartItemService.new(cart_items).increment_quantity(params[:id])

      render json: {}, status: :ok
    end

    def decrement_quantity
      authorize Cart

      @cart_item = CartItemService.new(cart_items).decrement_quantity(params[:id])

      @cart_item.destroy if @cart_item.quantity.zero?

      render json: {}, status: :ok
    end

    def toggle_favorite
      authorize Cart

      favorite = current_user.favorites.find_or_initialize_by(product_id: params[:id])

      if favorite.persisted?
        favorite.destroy
      else
        favorite.save
      end

      render json: {}, status: :ok
    end

    private

    def products_paginate
      @products_paginate ||= PaginationService.new(@products, MAX_ITEMS_ON_PAGE)
    end

    def authorized_products
      return {} unless current_user

      {}.tap do |hash|
        hash[:favorites_product_ids] = current_user.favorites.pluck(:product_id)
        hash[:cart_items_product_ids] = current_user.cart_items.pluck(:product_id)
      end
    end

    def sorted_products(products)
      products.order(Arel.sql('products.quantity = 0 ASC, products.name ASC'))
    end

    def cart_items
      @cart_items = current_user.cart_items
    end

    def products
      @products ||= Product.with_attached_image.all
    end
  end
end
