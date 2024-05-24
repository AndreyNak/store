# frozen_string_literal: true

class Product < ApplicationRecord
  include Rails.application.routes.url_helpers
  include Imageble

  has_one_attached :image

  has_and_belongs_to_many :type_products

  has_many :favorites
  has_many :cart_items, dependent: :destroy

  validates :name, :price, :image, :type_product_ids, presence: true
end
