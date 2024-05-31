# frozen_string_literal: true

module Order
  class ChangeStatusReceiptJob
    include Sidekiq::Job

    def perform(order_id)
      order = Order.find_by(id: order_id)
      return unless order
      return if order.cancelled?

      order.receipt
      order.received_at = Time.zone.now
      order.save
    end
  end
end
