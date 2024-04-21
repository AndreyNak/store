class AddIndrexToRroductName < ActiveRecord::Migration[7.1]
  def change
    add_index :products, :name
  end
end
