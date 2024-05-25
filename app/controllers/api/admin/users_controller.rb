# frozen_string_literal: true

module Api
  module Admin
    class UsersController < Admin::BaseController
      MAX_ITEMS_ON_PAGE = 20

      before_action :set_user, only: %i[show update]

      def index
        @users = UserSearchService.new(User.all).call(params)
        @users = users_pagination.pagin(params[:page]).includes(:role, :orders)
        @users = UserOrderService.new(@users).call(params)

        render json: UserBlueprint.render(
          @users,
          root: :users,
          meta: {
            paginate: {
              page: params[:page] || 1,
              maxPage: users_pagination.max_page
            }
          }
        )
      end

      def show
        render json: {
          user: {
            **UserBlueprint.render_as_json(@user),
            amountOrders: filtered_orders.amount_orders.to_i,
            paginateOrders: OrderBlueprint.render_as_json(paginate_orders, view: :profile),
            orders: OrderBlueprint.render_as_json(filtered_orders)
          },
          statuses: Order.aasm.states.map(&:name),
          paginate: { page: params[:page] || 1, maxPage: orders_pagination.max_page }
        }
      end

      def update
        if @user.update(user_params)
          render json: { notice: 'User roles were successfully updated.' }
        else
          render json: { error: 'Failed to update user roles.' }
        end
      end

      private

      def users_pagination
        @users_pagination ||= PaginationService.new(@users, MAX_ITEMS_ON_PAGE)
      end

      def orders_pagination
        @orders_pagination ||= PaginationService.new(filtered_orders, 5)
      end

      def paginate_orders
        @paginate_orders ||= orders_pagination.pagin(params[:page]).includes(order_items: :product)
      end

      def filtered_orders
        @filtered_orders ||= OrderSearchService.new(@user.orders).call(params).includes(
          order_items: { product: :type_products }
        )
      end

      def set_user
        @user = User.find(params[:id])
      end

      def user_params
        params.require(:user).permit(:role_id)
      end
    end
  end
end
