# frozen_string_literal: true

class ProductSearchService
  def initialize(products)
    @products = products
  end

  def call(search)
    @products = @products.where('name ILIKE ?', "%#{search}%") if search.present?
    @products
  end
end
