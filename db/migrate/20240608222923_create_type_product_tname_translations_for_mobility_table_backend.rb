class CreateTypeProductTnameTranslationsForMobilityTableBackend < ActiveRecord::Migration[7.1]
  def change
    create_table :type_product_translations do |t|

      # Translated attribute(s)
      t.string :tname

      t.string :locale, null: false
      t.references :type_product, null: false, foreign_key: true, index: false

      t.timestamps null: false
    end

    add_index :type_product_translations, :locale, name: :index_type_product_translations_on_locale
    add_index :type_product_translations, [:type_product_id, :locale], name: :index_type_product_translations_on_type_product_id_and_locale, unique: true

  end
end
