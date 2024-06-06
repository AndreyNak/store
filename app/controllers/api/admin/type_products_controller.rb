# frozen_string_literal: true

module Api
  module Admin
    class TypeProductsController < Admin::BaseController
      before_action :set_type_product, only: %i[update destroy]

      def index
        authorize TypeProduct

        @type_products = TypeProduct.all.order(id: :desc)

        render json: {
          type_products: TypeProductBlueprint.render_as_json(@type_products.includes(:products)),
          products: ProductBlueprint.render_as_json(Product.all, view: :without_type_products)
        }
      end

      def create
        authorize TypeProduct

        @type_product = TypeProduct.new(type_product_params)
        if @type_product.save
          render json: TypeProductBlueprint.render(@type_product)
        else
          render json: { errors: 'Продукт не создан' }
        end
      end

      def update
        authorize TypeProduct

        if @type_product.update(type_product_params)
          render json: TypeProductBlueprint.render(@type_product)
        else
          render json: { errors: @type_product.errors.full_messages }, status: :bad_request
        end
      end

      def destroy
        authorize TypeProduct

        @type_product.destroy
        render json: { notice: 'Тип продукт успешно удален' }
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
end
