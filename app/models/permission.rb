# frozen_string_literal: true

class Permission < ApplicationRecord
  has_and_belongs_to_many :roles

  validates :name, uniqueness: true

  has_many :denied_permissions, dependent: :destroy

  scope :order_by_permission_type, lambda {
    order(Arel.sql("split_part(split_part(name, '_', 3), '_', 1)"))
  }
end
