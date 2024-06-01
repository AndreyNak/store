# frozen_string_literal: true

class ProductBlueprint < BaseBlueprint
  identifier :id

  fields :name, :discount_price, :quantity, :description

  field :is_discount_active do |object|
    object.discount_active?
  end

  field :type_product_ids do |object|
    object.type_products.pluck(:id)
  end

  field :price do |product|
    product.price.to_i
  end

  field :discount_price do |product|
    product.discount_price&.to_i
  end

  view :admin do
    field :url_image do |object|
      object.base_url(:small)
    end

    field :discount_start_date do |product, _options|
      product.discount_start_date&.strftime('%Y-%m-%d')
    end

    field :discount_end_date do |product, _options|
      product.discount_end_date&.strftime('%Y-%m-%d')
    end
  end

  view :base do
    field :count_ordered_product do |object, options|
      PrependProduct.count_ordered(object, options[:user], options[:cart_items_product_ids])
    end

    field :url_image do |object|
      object.base_url(:medium)
    end

    field :is_selected do |object, options|
      options[:user].product_in_cart?(object.id, options[:cart_items_product_ids])
    end

    field :is_favorite_product do |object, options|
      options[:user].favorite?(object.id, options[:favorites_product_ids])
    end
  end

  view :show do
    field :url_image do |object|
      object.base_url(:large)
    end

    field :count_ordered_product do |object, options|
      PrependProduct.count_ordered(object, options[:user], options[:cart_items_product_ids])
    end
  end

  view :guest do
    field :url_image do |object|
      object.base_url(:medium)
    end
  end
end
