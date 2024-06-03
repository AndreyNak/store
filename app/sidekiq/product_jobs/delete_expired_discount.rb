# frozen_string_literal: true

module ProductJobs
  class DeleteExpiredDiscountJob
    include Sidekiq::Job

    def perform(product_id)
      product = Product.find_by(id: product_id)
      return unless product

      return unless product.discount_expired?

      product.update(discount_price: nil, discount_start_date: nil, discount_end_date: nil)
    end
  end
end
