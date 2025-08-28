# frozen_string_literal: true

module Validations
  module ProductValidation
    extend ActiveSupport::Concern

    included do
      validates :name, :quantity, :price, :image, :type_product_ids, presence: true
      validates :quantity, numericality: { greater_than_or_equal_to: 0 }

      validates :discount_start_date, presence: true, if: :discount_price?
      validates :discount_end_date, presence: true, if: :discount_price?
      validate :discount_dates_order
      validate :discount_price_validation
    end

    private

    def discount_dates_order
      unless discount_start_date.present? && discount_end_date.present? && discount_start_date >= discount_end_date
        return
      end

      errors.add(:discount_end_date, 'must be after the discount start date')
    end

    def discount_price_validation
      return unless discount_price.present? && (discount_price >= price || discount_price < 1)

      errors.add(:discount_price, 'must be less than the price and greater than 1')
    end
  end
end
