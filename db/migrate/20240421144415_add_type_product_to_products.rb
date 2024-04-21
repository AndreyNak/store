class AddTypeProductToProducts < ActiveRecord::Migration[7.1]
  def change
    add_reference :products, :type_product, foreign_key: true
  end
end
