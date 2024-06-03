# frozen_string_literal: true

class TypeProductBlueprint < BaseBlueprint
  identifier :id

  fields :name

  field :product_ids do |type_product|
    type_product.products.pluck(:id)
  end

  view :products do
    exclude :product_ids
  end
end
