# frozen_string_literal: true

module Api
  module Profile
    class OrdersController < ApiApplicationController
      MAX_ITEMS_ON_PAGE = 10

      before_action :authenticate_user!
      before_action :set_order, only: %i[cancel reject update]

      def index
        @orders = orders_pagination.pagin(params[:page])
                                   .with_total_amount
                                   .includes(order_items: { product: :translations })
                                   .order(created_at: :desc)

        render json: OrderBlueprint.render(
          @orders,
          root: :orders,
          view: :profile,
          meta: { paginate: { page: params[:page] || 1, maxPage: orders_pagination.max_page } }
        )
      end

      def cancel
        authorize [:profile, @order]

        @order.cancel
        @order.save

        notify_admin_order

        render json: UserBlueprint.render(current_user, view: :products), status: :ok
      end

      def reject
        authorize [:profile, @order]

        @order.reject
        @order.save

        notify_admin_order

        render json: { notice: I18n.t('profile.orders.reject.notice') }
      end

      def update
        authorize [:profile, @order]

        if @order.update(order_params)
          render json: { notice: I18n.t('profile.orders.update.notice') }
        else
          render json: { error: I18n.t('profile.orders.update.error') }
        end
      end

      private

      def notify_admin_order
        ActionCable.server.broadcast('admin_orders', OrderBlueprint.render_as_hash(@order, view: :products))
      end

      def set_order
        @order = current_user.orders.find(params[:id])
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
