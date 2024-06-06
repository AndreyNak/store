# frozen_string_literal: true

class UserBlueprint < BaseBlueprint
  identifier :id

  fields :email, :name, :address, :surname, :login, :date_of_birth, :created_at

  field :count_orders do |object|
    object.orders.size
  end

  field :is_admin do |object|
    object.admin?
  end

  association :role, blueprint: RoleBlueprint

  association :permissions, blueprint: PermissionBlueprint

  view :without_permissions do
    exclude :permissions
  end

  view :products do
    field :total_price do |object|
      object.cart_items.total_price.to_i
    end

    association :orders, name: :active_orders, view: :products, blueprint: OrderBlueprint do |object|
      object.orders.active_orders.includes(order_items: { product: :type_products })
    end

    association :cart, blueprint: CartBlueprint
  end

  view :comments do
    excludes :permissions, :address, :email, :date_of_birth, :created_at, :role, :count_orders
  end
end
