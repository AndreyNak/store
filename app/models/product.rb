# frozen_string_literal: true

class Product < ApplicationRecord
  include Validations::ProductValidation
  include Rails.application.routes.url_helpers
  include Imageble

  has_one_attached :image

  has_and_belongs_to_many :type_products

  has_many :comments, dependent: :destroy
  has_many :favorites
  has_many :cart_items, dependent: :destroy

  scope :with_discount, -> { where.not(discount_price: nil) }
  scope :sold_out, -> { where(quantity: 0) }

  def discount_active?
    return false unless discount_start_date.present? && discount_end_date.present?

    current_time = Time.current
    discount_start_date <= current_time && discount_end_date >= current_time
  end

  def discount_expired?
    discount_end_date < Time.current
  end
end
