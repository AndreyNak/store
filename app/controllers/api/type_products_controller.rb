module Api
  class TypeProductsController < ApiApplicationController
    def index
      render json: TypeProductBlueprint.render(TypeProduct.includes(:products).all)
    end
  end
end
