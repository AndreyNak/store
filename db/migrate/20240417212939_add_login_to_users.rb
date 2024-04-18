class AddLoginToUsers < ActiveRecord::Migration[7.1]
  def change
    add_column :users, :login, :string
    add_index :users, :login, unique: true
  end
end
