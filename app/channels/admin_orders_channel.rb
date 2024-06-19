class AdminOrdersChannel < ApplicationCable::Channel
  def subscribed
    stream_from 'admin_orders'
  end

  def unsubscribed; end
end
