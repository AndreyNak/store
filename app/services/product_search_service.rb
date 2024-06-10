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
    @products = @products.joins(:type_products).merge(TypeProduct.i18n { tname.matches("%#{params[:category]}%") })
  end

  def reduce_by_discount
    @products = @products.with_discount
  end

  def reduce_by_search(params)
    @products = @products.joins(:type_products)
                         .joins(product_translations_join)
                         .joins(type_product_translations_join)
                         .where(search_condition, search: "%#{params[:search]}%")
  end

  def product_translations_join
    "LEFT JOIN product_translations ON product_translations.product_id = products.id \n
    AND product_translations.locale = '#{I18n.locale}'"
  end

  def type_product_translations_join
    "LEFT JOIN type_product_translations ON type_product_translations.type_product_id = type_products.id \n
    AND type_product_translations.locale = '#{I18n.locale}'"
  end

  def search_condition
    'product_translations.tname ILIKE :search OR type_product_translations.tname ILIKE :search'
  end
end
