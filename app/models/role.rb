# frozen_string_literal: true

class Role < ApplicationRecord
  ROLES = %w[admin manager support user].freeze

  has_many :users
  has_and_belongs_to_many :permissions

  validates :name, inclusion: { in: ROLES, message: '%<value>s is not a valid role' }
end
