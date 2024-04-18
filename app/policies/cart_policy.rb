# frozen_string_literal: true

class CartPolicy < ApplicationPolicy
  def show?
    login?
  end

  def add_product?
    login?
  end

  def remove_product?
    login?
  end

  def increment_quantity?
    login?
  end

  def decrement_quantity?
    login?
  end
end
