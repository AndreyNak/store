# frozen_string_literal: true

class Product < ApplicationRecord
  include Validations::ProductValidation
  include Rails.application.routes.url_helpers
  include Imageble
  extend Mobility

  translates :tname, backend: :table

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

  def set_translations(translations)
    translations.each do |locale, name|
      Mobility.with_locale(locale) do
        self.name = name
      end
    end
  end

  def all_name_translations
    Mobility.available_locales.each_with_object({}) do |locale, translations|
      translations[locale] = Mobility.with_locale(locale) { self.name }
    end
  end
end
