# frozen_string_literal: true

module OrderJobs
  class ChangeStatusReceiptJob
    include Sidekiq::Job

    def perform(order_id)
      order = Order.find_by(id: order_id)
      return unless order
      return if order.cancelled?

      order.receipt
      order.received_at = Time.zone.now
      order.save

      notify_admin_order(order)
    end

    private

    def notify_admin_order(order)
      ActionCable.server.broadcast('admin_orders', OrderBlueprint.render_as_hash(order, view: :products))
    end
  end
end
