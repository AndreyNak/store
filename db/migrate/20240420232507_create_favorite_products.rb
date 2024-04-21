class CreateFavoriteProducts < ActiveRecord::Migration[7.1]
  def change
    create_table :favorites  do |t|
      t.references :user, foreign_key: true, null: false
      t.references :product, foreign_key: true, null: false

      t.timestamps
    end

    add_index :favorites , [:user_id, :product_id], unique: true
  end
end
