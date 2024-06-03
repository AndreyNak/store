# frozen_string_literal: true

class ProductSearchService
  def initialize(products)
    @products = products
  end

  def call(params, user)
    reduce_by_category(params) if params[:category].present?
    reduce_by_favorites(user) if user && params[:favorites] == 'true'
    reduce_by_search(params) if params[:search].present?
    reduce_by_discount if params[:discount] == 'true'
    reduce_by_sold_out if params[:sold_out] == 'true'

    @products
  end

  private

  def reduce_by_favorites(user)
    @products = @products.joins(:favorites).where(favorites: { user: })
  end

  def reduce_by_sold_out
    @products = @products.sold_out
  end

  def reduce_by_category(params)
    @products = @products.joins(:type_products).where(type_products: { name: params[:category] })
  end

  def reduce_by_discount
    @products = @products.with_discount
  end

  def reduce_by_search(params)
    @products = @products.joins(:type_products).where(
      'products.name ILIKE :search OR type_products.name ILIKE :search', search: "%#{params[:search]}%"
    )
  end
end
