class CreateComment < ActiveRecord::Migration[7.1]
  def change
    create_table :comments do |t|
      t.text :text, null: false
      t.integer :rating
      t.integer :parent_id
      t.references :user, null: false, foreign_key: true
      t.references :product, null: false, foreign_key: true

      t.timestamps
    end

    add_index :comments, :parent_id
  end
end
