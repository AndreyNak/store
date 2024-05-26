class AddProceToOrderItems < ActiveRecord::Migration[7.1]
  def change
    add_column :order_items, :price, :decimal
  end
end
