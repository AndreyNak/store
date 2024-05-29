class TypeProductBlueprint < BaseBlueprint
  identifier :id

  fields :name

  field :product_ids do |type_product|
    type_product.products.pluck(:id)
  end
end
