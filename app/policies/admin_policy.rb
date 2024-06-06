# frozen_string_literal: true

class AdminPolicy < ApplicationPolicy
  def index?
    permissions.can_view_admin?
  end
end
