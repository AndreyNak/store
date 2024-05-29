module Api
  module Admin
    class ProductsController < Admin::BaseController
      before_action :set_product, only: %i[update destroy make_discount]

      def index
        @products = ProductSearchService.new(products.includes(:type_products)).call(params, current_user).order(id: :desc)

        render json: ProductBlueprint.render(@products, view: :admin)
      end

      def create
        @product = Product.new(product_params)
        if @product.save
          render json: ProductBlueprint.render(@product, view: :admin)
        else
          render json: { errors: @product.errors.full_messages }, status: :bad_request
        end
      end

      def update
        if @product.update(product_params)
          render json: ProductBlueprint.render(@product, view: :admin)
        else
          render json: { errors: @product.errors.full_messages }, status: :bad_request
        end
      end

      def destroy
        @product.destroy
        render json: { notice: 'Продукт успешно удален' }
      end

      def make_discount
        if @product.update(product_params_discount)
          render json: ProductBlueprint.render(@product, view: :admin)
        else
          render json: { errors: @product.errors.full_messages }, status: :bad_request
        end
      end

      private

      def set_product
        @product = Product.find(params[:id] || params[:product_id])
      end

      def products
        @products ||= Product.with_attached_image.all
      end

      def product_params
        params.require(:product).permit(:name, :description, :quantity, :image, :price, type_product_ids: [])
      end

      def product_params_discount
        params.require(:product).permit(:discount_price)
      end
    end
  end
end
