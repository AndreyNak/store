class CreateDeniedPermissions < ActiveRecord::Migration[7.1]
  def change
    create_table :denied_permissions do |t|
      t.references :user, null: false, foreign_key: true
      t.references :permission, null: false, foreign_key: true

      t.timestamps

      t.index %i[user_id permission_id], unique: true
    end

    remove_index :denied_permissions, :user_id
    remove_index :denied_permissions, :permission_id
  end
end
