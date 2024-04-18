class AddDetailsToUsers < ActiveRecord::Migration[7.1]
  def change
    add_column :users, :name, :string
    add_column :users, :surname, :string
    add_column :users, :date_of_birth, :date
    add_column :users, :address, :string
  end
end
