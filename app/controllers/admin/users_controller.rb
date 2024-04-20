# frozen_string_literal: true

module Admin
  class UsersController < ApplicationController
    before_action :authenticate_user!

    def index
      authorize %i[admin user]

      @users = User.all.includes(:roles)
    end

    def show
      @user = User.find(params[:id])
      @orders = @user.orders.page(params[:page]).per(5)
    end

    def update
      authorize %i[admin user]

      @user = User.find(params[:id])
      if @user.update(user_params)
        redirect_to admin_users_path, notice: 'User roles were successfully updated.'
      else
        redirect_to admin_users_path, alert: 'Failed to update user roles.'
      end
    end

    private

    def user_params
      params.require(:user).permit(role_ids: [])
    end
  end
end
