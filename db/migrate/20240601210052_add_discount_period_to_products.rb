class AddDiscountPeriodToProducts < ActiveRecord::Migration[7.1]
  def change
    add_column :products, :discount_start_date, :datetime
    add_column :products, :discount_end_date, :datetime
  end
end
