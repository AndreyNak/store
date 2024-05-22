# frozen_string_literal: true

class Product < ApplicationRecord
  include Rails.application.routes.url_helpers

  has_one_attached :image

  has_and_belongs_to_many :type_products

  has_many :favorites
  has_many :cart_items, dependent: :destroy

  validates :name, :price, :image, :type_product_ids, presence: true

  def base_url
    "http://localhost:3000#{polymorphic_url(image.variant(resize_to_limit: [316, 240]), only_path: true)}" if image.attached?
  end
end
