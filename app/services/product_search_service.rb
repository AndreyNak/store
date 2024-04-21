# frozen_string_literal: true

class ProductSearchService
  def initialize(products)
    @products = products
  end

  def call(params, user)
    @products = @products.joins(:favorites).where(favorites: { user: }) if user && params[:filter].present?

    if user && params[:search].present?
      @products = @products.joins(:type_products).where(
        'products.name ILIKE :search OR type_products.name ILIKE :search', search: "%#{params[:search]}%"
      )
    end

    @products
  end
end
