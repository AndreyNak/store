# frozen_string_literal: true

class OrderItemsBlueprint < BaseBlueprint
  identifier :id

  fields :quantity

  association :product, blueprint: ProductBlueprint, view: :without_type_products
end
