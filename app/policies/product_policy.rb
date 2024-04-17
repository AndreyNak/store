# frozen_string_literal: true

class ProductPolicy < ApplicationPolicy
  def edit?
    admin?
  end

  def update?
    admin?
  end

  def destroy?
    admin?
  end

  def create?
    admin?
  end
end
