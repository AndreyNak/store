class CreateRestrictions < ActiveRecord::Migration[7.1]
  def change
    create_table :restrictions do |t|
      t.references :offender, foreign_key: { to_table: :users }, null: false
      t.references :officer, foreign_key: { to_table: :users }, null: false
      t.references :canceller, foreign_key: { to_table: :users }, null: true
      t.references :permission, null: false, foreign_key: true
      t.text :reason
      t.datetime :expired_at, null: false
      t.datetime :cancelled_at

      t.timestamps
    end
  end
end
