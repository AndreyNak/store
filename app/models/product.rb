# frozen_string_literal: true

class Product < ApplicationRecord
  has_one_attached :image

  validates :name, :price, :image, presence: true
  has_many :cart_items, dependent: :destroy
end
