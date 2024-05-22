# frozen_string_literal: true

module Api
  module Admin
    class UsersController < Admin::BaseController
      MAX_ITEMS_ON_PAGE = 20

      def index
        @users = UserSearchService.new(User.all).call(params)
        max_page = (@users.count.to_f / MAX_ITEMS_ON_PAGE).ceil

        @users = PaginationService.new(@users, MAX_ITEMS_ON_PAGE).call(params[:page]).includes(:role, :orders)
        @users = UserOrderService.new(@users).call(params)

        render json: UserBlueprint.render(
          @users,
          root: :users,
          meta: { paginate: { page: params[:page] || 1, maxPage: max_page } }
        )
      end

      def show
        @user = User.find(params[:id])
        filtered_orders = OrderSearchService.new(@user.orders).call(params).includes(order_items: :product)
        max_page = (filtered_orders.count.to_f / 5).ceil
        paginate_orders = PaginationService.new(filtered_orders, 5).call(params[:page]).includes(order_items: :product)

        render json: UserBlueprint.render(
          @user,
          view: :user_page,
          root: :user,
          amount_orders: filtered_orders.amount_orders,
          filtered_orders: filtered_orders.to_a,
          paginate_orders: paginate_orders.to_a,
          meta: {
            statuses: Order.aasm.states.map(&:name),
            paginate: { page: params[:page] || 1, maxPage: max_page }
          }
        )
      end

      def update
        @user = User.find(params[:id])
        if @user.update(user_params)
          render json: { notice: 'User roles were successfully updated.' }
        else
          render json: { error: 'Failed to update user roles.' }
        end
      end

      private

      def user_params
        params.require(:user).permit(:role_id)
      end
    end
  end
end
