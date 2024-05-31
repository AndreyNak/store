# frozen_string_literal: true

module Admin
  class TypeProductPolicy < ApplicationPolicy
    def index?
      admin?
    end

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
end
