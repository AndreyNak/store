class AddIndexPermissionRole < ActiveRecord::Migration[7.1]
  def change
    add_index :permissions_roles, %i[role_id permission_id], unique: true
  end
end
