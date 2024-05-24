module Api
  module Profile
    class OrdersController < ApiApplicationController
      before_action :authenticate_user!

      MAX_ITEMS_ON_PAGE = 10

      def index
        @orders = current_user.orders

        max_page = (@orders.count.to_f / MAX_ITEMS_ON_PAGE).ceil

        @orders = PaginationService.new(
          @orders, MAX_ITEMS_ON_PAGE
        ).pagin(params[:page]).includes(order_items: :product).order(created_at: :desc)

        render json: OrderBlueprint.render(
          @orders,
          root: :orders,
          view: :profile,
          meta: { paginate: { page: params[:page] || 1, maxPage: max_page } }
        )
      end

      def cancel
        order = current_user.orders.find(params[:order_id])
        order.cancel
        if order.save
          render json: UserBlueprint.render(current_user, view: :products), status: :ok
        else
          render json: { error: 'Order not cancel' }
        end
      end

      def reject
        order = current_user.orders.find(params[:order_id])
        order.reject
        if order.save
          render json: { notice: 'Order rejected successfully' }
        else
          render json: { error: 'Order not reject' }
        end
      end

      def update
        @order = current_user.orders.find(params[:id])
        if @order.update(order_params)
          render json: { notice: 'Order rating updated successfully' }
        else
          render json: { error: 'Failed to update order rating' }
        end
      end

      private

      def order_params
        params.require(:order).permit(:rating)
      end
    end
  end
end
