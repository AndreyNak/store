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

      OrderJobs::ChangeStatusReceiptJob.perform_in(rand(2..8).minutes, order.id)

      notify_admin_order(order)
    end

    private

    def notify_admin_order(order)
      ActionCable.server.broadcast('admin_orders', OrderBlueprint.render_as_hash(order, view: :products))
    end
  end
end
