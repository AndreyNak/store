# frozen_string_literal: true

class CartItemBlueprint < BaseBlueprint
  identifier :id

  fields :quantity

  association :product, blueprint: ProductBlueprint
end
