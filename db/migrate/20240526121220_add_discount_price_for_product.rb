class AddDiscountPriceForProduct < ActiveRecord::Migration[7.1]
  def change
    add_column :products, :discount_price, :decimal
  end
end
