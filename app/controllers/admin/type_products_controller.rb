# frozen_string_literal: true

module Admin
  class TypeProductsController < ApplicationController
    before_action :authenticate_user!
    before_action :set_type_product, only: %i[edit update destroy]

    def index
      authorize %i[admin type_product]

      @type_products = TypeProduct.all
    end

    def new
      authorize %i[admin type_product]

      @type_product = TypeProduct.new
      @products = Product.all
    end

    def edit
      authorize %i[admin type_product]

      @products = Product.all
    end

    def create
      authorize %i[admin type_product]

      @type_product = TypeProduct.new(type_product_params)
      if @type_product.save
        redirect_to admin_type_products_path, notice: 'Продукт успешно создан'
      else
        render :new, alert: 'Продукт не создан'
      end
    end

    def update
      authorize %i[admin type_product]

      if @type_product.update(type_product_params)
        redirect_to admin_type_products_path, notice: 'Тип продуктов успешно обновлен'
      else
        render :edit
      end
    end

    def destroy
      authorize %i[admin type_product]

      @type_product.destroy
      redirect_to admin_type_products_path, notice: 'Тип продукт успешно удален'
    end

    private

    def set_type_product
      @type_product = TypeProduct.find(params[:id])
    end

    def type_product_params
      params.require(:type_product).permit(:name, :description, product_ids: [])
    end
  end
end
