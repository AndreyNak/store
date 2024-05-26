module Api
  module Profile
    class OrdersController < ApiApplicationController
      MAX_ITEMS_ON_PAGE = 10

      before_action :authenticate_user!
      before_action :set_order, only: %i[cancel reject update]

      def index
        @orders = orders_pagination.pagin(params[:page]).includes(order_items: :product).order(created_at: :desc)

        render json: OrderBlueprint.render(
          @orders,
          root: :orders,
          view: :profile,
          meta: { paginate: { page: params[:page] || 1, maxPage: orders_pagination.max_page } }
        )
      end

      def cancel
        @order.cancel
        order.save

        render json: UserBlueprint.render(current_user, view: :products), status: :ok
      end

      def reject
        @order.reject
        order.save

        render json: { notice: 'Order rejected successfully' }
      end

      def update
        if @order.update(order_params)
          render json: { notice: 'Order rating updated successfully' }
        else
          render json: { error: 'Failed to update order rating' }
        end
      end

      private

      def set_order
        @order = current_user.orders.find(params[:order_id])
      end

      def orders_pagination
        @orders_pagination ||= PaginationService.new(current_user.orders, MAX_ITEMS_ON_PAGE)
      end

      def order_params
        params.require(:order).permit(:rating)
      end
    end
  end
end
