# frozen_string_literal: true

module Api
  module Admin
    class OrdersController < BaseController
      MAX_ITEMS_ON_PAGE = 20

      def index
        authorize Order

        filtered_orders(orders)
        render json: OrderBlueprint.render(paginate_orders, view: :admin)
      end

      def live
        authorize Order

        filtered_orders(orders.today)
        render json: OrderBlueprint.render(paginate_orders, view: :admin)
      end

      def statistics
        authorize Order

        result = Reports::ReportOrdersService.new(Order.all).call(params)

        render json: result
      end

      def states
        authorize Order

        render json: Order.aasm.states.map(&:name)
      end

      private

      def filtered_orders(orders)
        @orders = ::Admin::Orders::OrderSearchService.new(orders).call(params)
      end

      def paginate_orders
        @paginate_orders ||= PaginationService.new(orders, MAX_ITEMS_ON_PAGE)
                                              .infinite_scroll(params[:page])
                                              .with_total_amount
                                              .includes(:user, order_items: { product: :translations })
      end

      def orders
        @orders ||= Order.order(created_at: :desc)
      end
    end
  end
end
