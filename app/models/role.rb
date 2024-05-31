# frozen_string_literal: true

class Role < ApplicationRecord
  ROLES = %w[admin user].freeze

  has_many :user

  validates :name, inclusion: { in: ROLES, message: '%<value>s is not a valid role' }
end
