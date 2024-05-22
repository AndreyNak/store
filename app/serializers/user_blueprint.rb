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

  view :user_page do
    field :amount_orders do |_user, options|
      options[:amount_orders].to_i
    end

    association :paginate_orders, blueprint: OrderBlueprint, view: :profile do |_user, options|
      options[:paginate_orders]
    end

    association :orders, blueprint: OrderBlueprint do |_user, options|
      options[:filtered_orders]
    end
  end

  view :products do
    field :total_price do |object|
      object.cart_items.total_price.to_i
    end

    association :orders, name: :active_orders, view: :products, blueprint: OrderBlueprint do |object|
      OrderPreparationService.new(object.orders).active_orders
    end

    association :cart, blueprint: CartBlueprint
  end
end
