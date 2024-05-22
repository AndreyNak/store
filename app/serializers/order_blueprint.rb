class OrderBlueprint < BaseBlueprint
  identifier :id

  fields :status

  field :created_at do |object|
    object.created_at.strftime('%Y-%m-%d, %H:%M')
  end

  association :order_items, blueprint: OrderItemsBlueprint

  view :products do
    field :amount_order do |object|
      object.amount_order.to_i
    end
  end

  view :profile do
    field :amount_order do |object|
      object.amount_order.to_i
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
