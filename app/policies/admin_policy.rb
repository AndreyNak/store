# frozen_string_literal: true

class AdminPolicy < ApplicationPolicy
  def index?
    user.can_view_admin?
  end
end
