# frozen_string_literal: true

class MessagePublisher
  class << self
    def publish(exchange, message = {})
      queue = channel.fanout("store.#{exchange}")
      queue.publish(message.to_json)
    end

    def channel
      @channel ||= RABBITMQ_CONNECTION.create_channel
    end
  end

  # def self.publish(message, queue_name)
  #   queue = channel.queue(queue_name)

  #   queue.publish(message, persistent: true)

  #   channel.close
  # end
end
