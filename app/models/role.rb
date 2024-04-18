# frozen_string_literal: true

class Role < ApplicationRecord
  ROLES = ['admin', 'user']

  has_and_belongs_to_many :users

  validates :name, inclusion: { in: ROLES, message: "%{value} is not a valid role" }

end
