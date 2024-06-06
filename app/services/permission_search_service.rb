# frozen_string_literal: true

class PermissionSearchService
  def initialize(permissions)
    @permissions = permissions
  end

  def call(params)
    reduce_by_search(params) if params[:search].present?

    @permissions
  end

  private

  def reduce_by_search(params)
    @permissions = @permissions.where('permissions.name ILIKE :search', search: "%#{params[:search]}%")
  end
end
