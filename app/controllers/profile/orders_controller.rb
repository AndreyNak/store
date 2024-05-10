class Profile::OrdersController < ApplicationController
  before_action :authenticate_user!

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

  def update
    @order = current_user.orders.find(params[:id])
    if @order.update(order_params)
      redirect_to profile_orders_path, notice: 'Order rating updated successfully'
    else
      render :index, alert: 'Failed to update order rating'
    end
  end

  private

  def order_params
    params.require(:order).permit(:rating)
  end
end
