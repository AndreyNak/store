class ProductBlueprint < BaseBlueprint
  identifier :id

  fields :name, :discount_price, :description, :type_product_ids

  field :price do |product|
    product.price.to_i
  end

  field :discount_price do |product|
    product.discount_price.to_i
  end

  view :admin do
    field :url_image do |object|
      object.base_url(:small)
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

  view :guest do
    field :url_image do |object|
      object.base_url(:medium)
    end
  end
end
