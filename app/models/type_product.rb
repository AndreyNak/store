# frozen_string_literal: true

class TypeProduct < ApplicationRecord
  extend Mobility

  has_and_belongs_to_many :products

  translates :tname, backend: :table
end
