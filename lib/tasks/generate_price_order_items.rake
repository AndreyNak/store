namespace :update do
  task generate_price_order_items: :environment do
    OrderItem.where(price: nil).update_all(
      "price = COALESCE(
        (SELECT discount_price FROM products WHERE products.id = order_items.product_id),
        (SELECT price FROM products WHERE products.id = order_items.product_id)
      )"
    )

    p 'Generate completed!'
  end
end
