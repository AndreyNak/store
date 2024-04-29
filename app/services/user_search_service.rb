# frozen_string_literal: true

class UserSearchService
  def initialize(users)
    @users = users
  end

  def call(params)
    if params[:search].present?
      @users = @users.where('users.login ILIKE :search OR users.email ILIKE :search', search: "%#{params[:search]}%")
    end

    @users = reduce_by_sort_by(params[:sort_by]) if params[:sort_by].present?

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

    sorts[param.to_sym] || @users
  end
end
