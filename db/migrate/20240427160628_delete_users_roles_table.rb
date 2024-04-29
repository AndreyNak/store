class DeleteUsersRolesTable < ActiveRecord::Migration[7.1]
  def change
    drop_table :roles_users
  end
end
