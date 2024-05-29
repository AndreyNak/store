module Products
  class CommentPolicy < ApplicationPolicy
    def index?
      true
    end

    def create?
      login?
    end

    def toggle_like?
      login?
    end
  end
end
