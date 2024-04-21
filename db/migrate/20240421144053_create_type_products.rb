class CreateTypeProducts < ActiveRecord::Migration[7.1]
  def change
    create_table :type_products do |t|
      t.string :name, null: false
      t.text :description

      t.timestamps
    end

    add_index :type_products, :name, unique: true
  end
end
