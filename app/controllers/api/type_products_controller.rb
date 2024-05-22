module Api
  class TypeProductsController < ApiApplicationController
    def index
      render json: TypeProductBlueprint.render(TypeProduct.all)
    end
  end
end
