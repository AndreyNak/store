# frozen_string_literal: true

class UserOrderService
  def initialize(users)
    @users = users
  end

  def call(params)
    reduce_by_sort_by(params[:sort_by]) if params[:sort_by].present?

    @users
  end

  private

  def reduce_by_sort_by(param)
    sorts = {
      email: @users.order(:email),
      count_order: @users.left_joins(:orders)
                         .select('users.*, COUNT(orders.id) AS count')
                         .group('users.id')
                         .order('count DESC')
    }

    @users = sorts[param.to_sym] || @users
  end
end
