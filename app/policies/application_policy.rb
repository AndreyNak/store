# frozen_string_literal: true

class ApplicationPolicy
  attr_reader :user, :record, :permissions

  def initialize(user, record)
    @user = user
    @record = record
    @permissions = user.permissions
  end

  def index?
    false
  end

  def show?
    false
  end

  def create?
    false
  end

  def new?
    create?
  end

  def update?
    false
  end

  def edit?
    update?
  end

  def destroy?
    false
  end

  def login?
    user
  end

  def admin?
    login? && user.admin?
  end

  class Scope
    def initialize(user, scope)
      @user = user
      @scope = scope
    end

    def resolve
      raise NotImplementedError, "You must define #resolve in #{self.class}"
    end

    private

    attr_reader :user, :scope
  end
end
