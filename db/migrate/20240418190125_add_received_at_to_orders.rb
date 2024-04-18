class AddReceivedAtToOrders < ActiveRecord::Migration[7.1]
  def change
    add_column :orders, :received_at, :datetime
  end
end
