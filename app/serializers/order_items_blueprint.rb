class OrderItemsBlueprint < BaseBlueprint
  identifier :id

  fields :quantity

  association :product, blueprint: ProductBlueprint
end