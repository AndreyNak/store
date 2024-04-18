class Profile::OrdersController < ApplicationController
  def index
    @orders = current_user.orders.order(created_at: :desc).includes(order_items: :product)
  end


  def cancel
    order = current_user.orders.find(params[:order_id])
    order.cancel
    if order.save
      redirect_to profile_orders_path, notice: 'Order cancelled successfully'
    else
      redirect_to profile_orders_path, alert: 'Order not cancel'
    end
  end

  def reject
    order = current_user.orders.find(params[:order_id])
    order.reject
    if order.save
      redirect_to profile_orders_path, notice: 'Order rejected successfully'
    else
      redirect_to profile_orders_path, alert: 'Order not reject'
    end
  end
end
