# frozen_string_literal: true

class OrderBlueprint < BaseBlueprint
  identifier :id

  fields :status

  field :created_at do |object|
    object.created_at.strftime('%Y-%m-%d, %H:%M')
  end

  association :order_items, blueprint: OrderItemsBlueprint

  view :products do
    field :amount_order do |object|
      object.total_amount.to_i
    end
  end

  view :admin do
    field :amount_order do |object|
      object.total_amount.to_i
    end

    association :user, blueprint: UserBlueprint, view: :without_permissions
  end

  view :statistics do
    excludes :created_at, :id, :status, :order_items

    fields :date, :counts
  end

  view :profile do
    field :amount_order do |object|
      object.total_amount.to_i
    end

    fields :received_at, :rating

    field :expired do |object|
      object.expired?
    end

    field :delivering do |object|
      object.delivering?
    end

    field :pending do |object|
      object.pending?
    end

    field :received do |object|
      object.received?
    end
  end
end
