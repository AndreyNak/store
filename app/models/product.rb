# frozen_string_literal: true

class Product < ApplicationRecord
  include Rails.application.routes.url_helpers
  include Imageble

  has_one_attached :image

  has_and_belongs_to_many :type_products

  has_many :comments
  has_many :favorites
  has_many :cart_items, dependent: :destroy

  validates :name, :quantity, :price, :image, :type_product_ids, presence: true
  validates :quantity, numericality: { greater_than_or_equal_to: 0 }

  validate :discount_price_validation

  scope :with_discount, -> { where.not(discount_price: nil) }

  def discount_price_validation
    return unless discount_price.present? && (discount_price >= price || discount_price < 1)

    errors.add(:discount_price, 'must be less than the price and greater than 1')
  end
end
