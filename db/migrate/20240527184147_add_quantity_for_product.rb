class AddQuantityForProduct < ActiveRecord::Migration[7.1]
  def change
    add_column :products, :quantity, :integer, null: false, default: 0
  end
end
