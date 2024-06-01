# frozen_string_literal: true

module OrderJobs
  class ChangeStatusDeliverJob
    include Sidekiq::Job

    def perform(order_id)
      order = Order.find_by(id: order_id)
      return unless order
      return if order.cancelled?

      order.deliver
      order.save

      OrderJobs::ChangeStatusReceiptJob.perform_in(5.minutes, order.id)
    end
  end
end
