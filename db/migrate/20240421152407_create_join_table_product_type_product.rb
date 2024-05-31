class CreateJoinTableProductTypeProduct < ActiveRecord::Migration[7.1]
  def change
    create_join_table :products, :type_products do |t|
      t.index %i[type_product_id product_id], unique: true
    end
  end
end
