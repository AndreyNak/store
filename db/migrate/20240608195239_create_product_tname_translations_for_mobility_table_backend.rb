class CreateProductTnameTranslationsForMobilityTableBackend < ActiveRecord::Migration[7.1]
  def change
    create_table :product_translations do |t|

      # Translated attribute(s)
      t.string :tname

      t.string :locale, null: false
      t.references :product, null: false, foreign_key: true, index: false

      t.timestamps null: false
    end

    add_index :product_translations, :locale, name: :index_product_translations_on_locale
    add_index :product_translations, [:product_id, :locale], name: :index_product_translations_on_product_id_and_locale, unique: true

  end
end
