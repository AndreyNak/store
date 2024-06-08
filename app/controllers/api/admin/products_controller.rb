# frozen_string_literal: true

module Api
  module Admin
    class ProductsController < Admin::BaseController
      before_action :set_product, only: %i[update destroy make_discount]

      def index
        authorize Product

        count_sold_out = products.sold_out.size
        @products = ProductSearchService.new(products).call(params,
                                                                                     current_user).order(id: :desc)

        render json: {
          products: ProductBlueprint.render_as_json(@products.with_attached_image.includes([:type_products, :translations]), view: :admin),
          countSoldOut: count_sold_out,
          type_products: TypeProductBlueprint.render_as_json(TypeProduct.all, view: :products)
        }
      end

      def create
        authorize Product

        @product = Product.new(product_params)
        if @product.save
          render json: ProductBlueprint.render(@product, view: :admin)
        else
          render json: { errors: @product.errors.full_messages }, status: :bad_request
        end
      end

      def update
        authorize Product

        if @product.update(product_params)
          render json: ProductBlueprint.render(@product, view: :admin)
        else
          render json: { errors: @product.errors.full_messages }, status: :bad_request
        end
      end

      def destroy
        authorize Product

        @product.destroy
        render json: { notice: 'Продукт успешно удален' }
      end

      def make_discount
        authorize Product

        if @product.update(product_params_discount)
          ProductJobs::DeleteExpiredDiscountJob.perform_at(@product.discount_end_date, @product.id)

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
        params.require(:product).permit(
          :name,
          :tname_ru,
          :tname_en,
          :description,
          :quantity,
          :image,
          :price,
          type_product_ids: []
        )
      end

      def product_params_discount
        params.require(:product).permit(:discount_price, :discount_start_date, :discount_end_date)
      end
    end
  end
end
