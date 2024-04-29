# frozen_string_literal: true

module Admin
  class UsersController < Admin::BaseController
    def index
      @users = PaginationService.new(User, 20).call(params[:page]).includes(:role, :orders)
      @users = UserSearchService.new(@users).call(params)
      @roles = Role.all
    end

    def show
      @user = User.find(params[:id])
      @orders = OrderSearchService.new(@user.orders).call(params)
      @paginate_orders = PaginationService.new(@orders, 5).call(params[:page]).includes(order_items: :product)
    end

    def update
      @user = User.find(params[:id])
      if @user.update(user_params)
        redirect_to admin_users_path, notice: 'User roles were successfully updated.'
      else
        redirect_to admin_users_path, alert: 'Failed to update user roles.'
      end
    end

    private

    def user_params
      params.require(:user).permit(:role_id)
    end
  end
end
