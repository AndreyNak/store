class CreateJoinTablePermissionsRoles < ActiveRecord::Migration[7.1]
  def change
    create_join_table :permissions, :roles
  end
end
