# frozen_string_literal: true

class UserSearchService
  def initialize(users)
    @users = users
  end

  def call(params)
    reduce_by_search(params[:search]) if params[:search].present?

    @users
  end

  private

  def reduce_by_search(search)
    @users = @users.joins(:role).where(
      'users.login ILIKE :search OR users.email ILIKE :search OR roles.name ILIKE :search',
      search: "%#{search}%"
    )
  end
end
