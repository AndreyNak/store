class AddRatingToOrders < ActiveRecord::Migration[7.1]
  def change
    add_column :orders, :rating, :integer
  end
end
