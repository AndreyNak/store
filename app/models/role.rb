# frozen_string_literal: true

class Role < ApplicationRecord
  ROLES = ['admin', 'user']

  has_many :user

  validates :name, inclusion: { in: ROLES, message: "%{value} is not a valid role" }

end
