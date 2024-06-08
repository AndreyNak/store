# frozen_string_literal: true

class TypeProductBlueprint < BaseBlueprint
  identifier :id

  fields :name, :tname, :tname_en, :tname_ru

  field :product_ids do |type_product|
    type_product.products.pluck(:id)
  end

  view :products do
    exclude :product_ids
  end
end
